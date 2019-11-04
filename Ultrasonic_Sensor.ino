#include <ESP8266WiFi.h>
#include<FS.h>
 
const char *ssid = "Redmi";
const char *password =  "greatmaster";
 
const uint16_t port = 8090;
const char * host = "192.168.43.105";
// defines pins numbers
const int trigPin = 2;  //D4
const int echoPin = 0;  //D3

// defines variables
long duration;
int distance;
int t=5;
String MacAddr;

void createfile()
{

  File f = SPIFFS.open("daa.txt", "a+");
  f.print("5");
Serial.print("file is created succesfully");
f.close();
}



void setup() {
pinMode(trigPin, OUTPUT); // Sets the trigPin as an Output
pinMode(echoPin, INPUT); // Sets the echoPin as an Input
Serial.begin(115200); // Starts the serial communication
SPIFFS.begin();
  

WiFi.begin(ssid, password);
  while (WiFi.status() != WL_CONNECTED) {
    delay(500);
    Serial.println("...");
  }
 
  Serial.print("WiFi connected with IP: ");
  Serial.println(WiFi.localIP());
  createfile();
}

void loop() 
{
 WiFiClient client;
 
    if (!client.connect(host, port)) {
 
        Serial.println("Connection to host failed");
 
        delay(2000);
        return;
    }
// Clears the trigPin
digitalWrite(trigPin, LOW);
delayMicroseconds(2);

// Sets the trigPin on HIGH state for 10 micro seconds
digitalWrite(trigPin, HIGH);
delayMicroseconds(10);
digitalWrite(trigPin, LOW);

// Reads the echoPin, returns the sound wave travel time in microseconds
duration = pulseIn(echoPin, HIGH);

// Calculating the distance
distance= duration*0.034/2;

// Prints the distance on the Serial Monitor

MacAddr=WiFi.macAddress();
//client.print("Distance_Sensor");
//Serial.print(String(String(MacAddr)+String(distance)));
//Serial.print(String("New amount: $" + Money_amount));

//client.print(MacAddr);
//client.print(" , ");
//client.print(distance);
//client.print(" ");
//client.println();
client.print(MacAddr+String("")+String(distance));
  
  
//client.print(distance);
//client.print(",");
delay(t*1000);

}
