	var row1=0
        var end=0;
        var pno1=0;
        var start=0;	
        var el_up = document.getElementById("GFG_UP"); 

 function display()
   { 
            var cols = []; 
		 row1=parseInt(document.getElementById("tval2").value);
		 pno1=parseInt(document.getElementById("tval1").value);
	   	
		var pno=pno1;
	        console.log("In display",(pno1)+1);
		var row=row1;
		pno=pno-1;
		start=pno*row;
	        end=(start+parseInt(row))-1;
         
            for (var i = start; i <end; i++) 
	    { 
                for (var k in list[i])
	    	{ 
                    if (cols.indexOf(k) === -1)
	    		{ 
                        cols.push(k); 
                 	} 
                } 
            } 
              
            var table = document.createElement("table"); 
            var tr = table.insertRow(-1); 
            for (var i = 0; i < cols.length; i++)
	    { 
                var theader = document.createElement("th"); 
                theader.innerHTML = cols[i]; 
                tr.appendChild(theader); 
            } 
            for (var i = start; i <=end; i++)
	    { 
                trow = table.insertRow(-1); 
                for (var j = 0; j < cols.length; j++)
	    	{ 
                    var cell = trow.insertCell(-1); 
                    cell.innerHTML = list[i][cols[j]]; 
                } 
            } 
              
            var el = document.getElementById("table"); 
            el.innerHTML = ""; 
            el.appendChild(table);

	   document.getElementById("tval4").value=parseInt(list.length/row1);
   }
	
	function next()
	{
	     document.getElementById("tval1").value = pno1+1;
	    if(pno1*row1>=list.length)
		{
			return;
		}
		display();
	}
function prev()
        {
		
	     	document.getElementById("tval1").value = pno1-1; 
                if(pno1==0)
	    	{
	    		pno1+=2;
			return;
	    	}
                display();
        }
function goto1()
	{
		jmp=parseInt(document.getElementById("tval3").value);
		if(jmp*row1>list.length)
		{
			alert("Page Not Exist");
			return;
		}
	        document.getElementById("tval1").value = jmp;
		display();
	}	
