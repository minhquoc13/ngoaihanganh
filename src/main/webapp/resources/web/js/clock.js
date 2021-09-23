function updateClock(){
			var now = new Date();
			var dname = now.getDay(),
			mo = now.getMonth(),
			dnum = now.getDate(),
			yr = now.getFullYear(),
			hou = now.getHours(),
			min = now.getMinutes(),
			sec = now.getSeconds(),
			pe = "AM";
				
			if(hou >= 12){
			pe = "PM";
			}
			if(hou == 0){
			hou = 12;
			}
			if(hou > 12){
			hou = hou - 12;
			}
			Number.prototype.pad = function(digits){
			for(var n = this.toString(); n.length < digits; n = 0 + n);
			return n;
			}
			var months = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12"];
			var week = ["Chủ nhật", "Thứ 2", "Thứ 3", "Thứ 4", "Thứ 5", "Thứ 6", "Thứ 7"];
			var ids = ["dayname", "month", "daynum", "year", "hour", "minutes", "seconds", "period"];
			var values = [week[dname], months[mo], dnum.pad(2), yr, hou.pad(2), min.pad(2), sec.pad(2), pe];
			for(var i = 0; i < ids.length; i++)
			document.getElementById(ids[i]).firstChild.nodeValue = values[i];
			}
			function initClock(){
			updateClock();
			window.setInterval("updateClock()", 1);
			}