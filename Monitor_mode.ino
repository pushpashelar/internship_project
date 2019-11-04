#include <SimpleTimer.h>
#include <ESP8266WiFi.h>
#include <Ticker.h>  //Ticker Library
#include <FS.h>
#include<SoftwareSerial.h>
extern "C" {
  #include <user_interface.h>
}

#define DATA_LENGTH           112

#define TYPE_MANAGEMENT       0x00
#define TYPE_CONTROL          0x01
#define TYPE_DATA             0x02
#define SUBTYPE_PROBE_REQUEST 0x04

uint16_t port = 9009;               //port number of server
char * host = "192.168.43.105";   //address of database server
char macbuffer[50];    //buffer to store mac
String MacAddress;
int count=0;
SimpleTimer timer;


struct RxControl {
 signed rssi:8;// signal intensity of packet

 unsigned rate:4;
 unsigned is_group:1;
 unsigned:1;
 unsigned sig_mode:2; // 0:is 11n packet; 1:is not 11n packet;
 unsigned legacy_length:12; // if not 11n packet, shows length of packet.
 unsigned damatch0:1;
 unsigned damatch1:1;
 unsigned bssidmatch0:1;
 unsigned bssidmatch1:1;
 unsigned MCS:7; // if is 11n packet, shows the modulation and code used (range from 0 to 76)
 unsigned CWB:1; // if is 11n packet, shows if is HT40 packet or not
 unsigned HT_length:16;// if is 11n packet, shows length of packet.
 unsigned Smoothing:1;
 unsigned Not_Sounding:1;
 unsigned:1;
 unsigned Aggregation:1;
 unsigned STBC:2;
 unsigned FEC_CODING:1; // if is 11n packet, shows if is LDPC packet or not.
 unsigned SGI:1;
 unsigned rxend_state:8;
 unsigned ampdu_cnt:8;
 unsigned channel:4; //which channel this packet in.
 unsigned:12;

};

struct SnifferPacket{
   
     struct RxControl rx_ctrl;
    uint8_t data[DATA_LENGTH];
    uint16_t cnt;
    uint16_t len;

};

static void printDataSpan(uint16_t start, uint16_t size, uint8_t* data) {
  for(uint16_t i = start; i < DATA_LENGTH && i < start+size; i++) {
    Serial.write(data[i]);
  }
}

static void getMAC(char *addr, uint8_t* data, uint16_t offset) {
  sprintf(addr, "%02x:%02x:%02x:%02x:%02x:%02x", data[offset+0], data[offset+1], data[offset+2], data[offset+3], data[offset+4], data[offset+5]);
}

static void showMetadata(SnifferPacket *snifferPacket,File f) {
  

  unsigned int frameControl = ((unsigned int)snifferPacket->data[1] << 8) + snifferPacket->data[0];

  uint8_t version      = (frameControl & 0b0000000000000011) >> 0;
  uint8_t frameType    = (frameControl & 0b0000000000001100) >> 2;
  uint8_t frameSubType = (frameControl & 0b0000000011110000) >> 4;
  uint8_t toDS         = (frameControl & 0b0000000100000000) >> 8;
  uint8_t fromDS       = (frameControl & 0b0000001000000000) >> 9;

  // Only look for probe request packets
  if (frameType != TYPE_MANAGEMENT ||
      frameSubType != SUBTYPE_PROBE_REQUEST)
        return;
  wifi_promiscuous_enable(0);
  
  //WiFiClient client;
 
    //if (!client.connect(host, port)) {
 
       // Serial.println("Connection to host failed");
 
        //delay(100);
        //return;
    //}
  
  //client.print("hello");
  Serial.print("RSSI:");
  Serial.print(snifferPacket->rx_ctrl.rssi, DEC);
  Serial.print(",");
  
  f.print(macbuffer);
  f.print(",");
  Serial.print(macbuffer);
  Serial.print(",");
  f.print(snifferPacket->rx_ctrl.rssi,DEC);
  f.print(",");
 

  char addr[] = "00:00:00:00:00:00";
  getMAC(addr, snifferPacket->data, 10);
  count=count+1;
  
  Serial.print(macbuffer);
  Serial.print("-");
  Serial.print(count);
  Serial.print(addr);


  f.print(count);

  f.print(",");
  
  Serial.print(",");
  Serial.print(addr);
  f.print(addr);
  f.print(" ");

  uint8_t SSID_length = snifferPacket->data[25];
  Serial.print("SSID:");
  printDataSpan(26, SSID_length, snifferPacket->data);
  Serial.println();

  

  //char addr1[]="00:00:00:00:00:00";
//  getMAC(addr,snifferPacket->data,45);
//  Serial.print("AP_MAC=");
//  Serial.print(addr);
}

/**
 * Callback for promiscuous mode
 */
static void ICACHE_FLASH_ATTR sniffer_callback(uint8_t *buffer, uint16_t length) {
  File f = SPIFFS.open("data.txt", "a+");
  struct SnifferPacket *snifferPacket = (struct SnifferPacket*) buffer;
  showMetadata(snifferPacket,f);
  f.close();
}

void sendDataToDevice() {
  int count=0,VarTemp=0;
   count=VarTemp;
  //wifi_promiscuous_enable(0);
 
  
  WiFi.begin("sam","211111111h");

  Serial.print("Connecting");
  while (WiFi.status() != WL_CONNECTED)
  {
    delay(500);
    Serial.print(".");
  }
  Serial.println();

  Serial.print("Connected, IP address: ");
  Serial.println(WiFi.localIP());
  WiFiClient client;
 
    if (!client.connect(host, port)) {
 
        Serial.println("Connection to host failed");
 
        delay(100);
        return;
    }
 
    Serial.println("Connected to server successful!");
    File f = SPIFFS.open("data.txt", "r");
    if (!f) {
      client.print("No data available");
    }
    while(f.available()){
    
     String s=f.readStringUntil('\n');
        
     client.print(s);
    }
    f.close();
    SPIFFS.remove("data.txt");
    Serial.println("Disconnecting...");
    client.stop();
    Serial.println("Disconneted");
    
}

void setup() {
//  Serial.println(packet:ie_table()[0]);
  int temp=0;
  Serial.begin(115200);
  SPIFFS.begin();
  
  wifi_set_opmode(STATION_MODE);
  wifi_set_channel(1);
 
  //get the mac address and put into the macbuffer
  MacAddress=WiFi.macAddress();
  MacAddress.toCharArray(macbuffer,50);
  
  timer.setInterval(10000,sendDataToDevice);
  
 
}

void loop() {
   int temp=0;
 
   timer.run();
   
   unsigned long start = millis();
 
   wifi_set_promiscuous_rx_cb(sniffer_callback);
   Serial.println("init");
 
   wifi_promiscuous_enable(1);
   while(millis() - start < 10*1000) {
    delay(3);
    }
 
   count=temp;

}
