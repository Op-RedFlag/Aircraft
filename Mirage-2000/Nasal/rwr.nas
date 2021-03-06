print("*** LOADING rwr.nas ... ***");

RWRCanvas = {
    new: func (root, center, diameter) {
        var rwr = {parents: [RWRCanvas]};
        rwr.max_icons = 12;
        var radius = diameter/2;
        rwr.inner_radius = radius*0.30;
        rwr.outer_radius = radius*0.75;
        rwr.circle_radius_big = radius*0.5;
        rwr.circle_radius_small = radius*0.125;
        var tick_long = radius*0.25;
        var tick_short = tick_long*0.5;
        var font = int(0.08*diameter);
        var colorG = [0.3,1,0.3];
        var colorLG = [0,0.5,0];
        rwr.fadeTime = 7;#seconds
        rwr.rootCenter = root.createChild("group")
                .setTranslation(center[0],center[1]);
        
#        root.createChild("path")
#           .moveTo(0, diameter/2)
#           .arcSmallCW(diameter/2, diameter/2, 0, diameter, 0)
#           .arcSmallCW(diameter/2, diameter/2, 0, -diameter, 0)
#           .setStrokeLineWidth(1)
#           .setColor(1, 1, 1);
        root.createChild("path")
           .moveTo(diameter/2-rwr.circle_radius_small, diameter/2)
           .arcSmallCW(rwr.circle_radius_small, rwr.circle_radius_small, 0, rwr.circle_radius_small*2, 0)
           .arcSmallCW(rwr.circle_radius_small, rwr.circle_radius_small, 0, -rwr.circle_radius_small*2, 0)
           .setStrokeLineWidth(1)
           .setColor(colorLG);
        root.createChild("path")
           .moveTo(diameter/2-rwr.circle_radius_big, diameter/2)
           .arcSmallCW(rwr.circle_radius_big, rwr.circle_radius_big, 0, rwr.circle_radius_big*2, 0)
           .arcSmallCW(rwr.circle_radius_big, rwr.circle_radius_big, 0, -rwr.circle_radius_big*2, 0)
           .setStrokeLineWidth(1)
           .setColor(colorLG);
        root.createChild("path")
           .moveTo(diameter/2-rwr.circle_radius_small/2, diameter/2)
           .lineTo(diameter/2+rwr.circle_radius_small/2, diameter/2)
           .moveTo(diameter/2, diameter/2-rwr.circle_radius_small/2)
           .lineTo(diameter/2, diameter/2+rwr.circle_radius_small/2)
           .setStrokeLineWidth(1)
           .setColor(colorLG);
        root.createChild("path")
           .moveTo(0,diameter*0.5)
           .horiz(tick_long)
           .moveTo(diameter,diameter*0.5)
           .horiz(-tick_long)
           .moveTo(diameter*0.5,0)
           .vert(tick_long)
           .moveTo(diameter*0.5,diameter)
           .vert(-tick_long)
           .setStrokeLineWidth(1)
           .setColor(colorLG);
        rwr.rootCenter.createChild("path")
           .moveTo(radius*math.cos(30*D2R),radius*math.sin(-30*D2R))
           .lineTo((radius-tick_short)*math.cos(30*D2R),(radius-tick_short)*math.sin(-30*D2R))
           .moveTo(radius*math.cos(60*D2R),radius*math.sin(-60*D2R))
           .lineTo((radius-tick_short)*math.cos(60*D2R),(radius-tick_short)*math.sin(-60*D2R))
           .moveTo(radius*math.cos(30*D2R),radius*math.sin(30*D2R))
           .lineTo((radius-tick_short)*math.cos(30*D2R),(radius-tick_short)*math.sin(30*D2R))
           .moveTo(radius*math.cos(60*D2R),radius*math.sin(60*D2R))
           .lineTo((radius-tick_short)*math.cos(60*D2R),(radius-tick_short)*math.sin(60*D2R))

           .moveTo(-radius*math.cos(30*D2R),radius*math.sin(-30*D2R))
           .lineTo(-(radius-tick_short)*math.cos(30*D2R),(radius-tick_short)*math.sin(-30*D2R))
           .moveTo(-radius*math.cos(60*D2R),radius*math.sin(-60*D2R))
           .lineTo(-(radius-tick_short)*math.cos(60*D2R),(radius-tick_short)*math.sin(-60*D2R))
           .moveTo(-radius*math.cos(30*D2R),radius*math.sin(30*D2R))
           .lineTo(-(radius-tick_short)*math.cos(30*D2R),(radius-tick_short)*math.sin(30*D2R))
           .moveTo(-radius*math.cos(60*D2R),radius*math.sin(60*D2R))
           .lineTo(-(radius-tick_short)*math.cos(60*D2R),(radius-tick_short)*math.sin(60*D2R))
           .setStrokeLineWidth(1)
           .setColor(colorLG);
        rwr.texts = setsize([],rwr.max_icons);
        for (var i = 0;i<rwr.max_icons;i+=1) {
            rwr.texts[i] = rwr.rootCenter.createChild("text")
                .setText("00")
                .setAlignment("center-center")
                .setColor(colorG)
                .setFontSize(font, 1.0)
                .hide();

        }
        rwr.symbol_hat = setsize([],rwr.max_icons);
        for (var i = 0;i<rwr.max_icons;i+=1) {
            rwr.symbol_hat[i] = rwr.rootCenter.createChild("path")
                    .moveTo(0,-font)
                    .lineTo(font*0.7,-font*0.5)
                    .moveTo(0,-font)
                    .lineTo(-font*0.7,-font*0.5)
                    .setStrokeLineWidth(1)
                    .setColor(colorG)
                    .hide();
        }

 #       me.symbol_16_SAM = setsize([],max_icons);
#       for (var i = 0;i<max_icons;i+=1) {
 #          me.symbol_16_SAM[i] = me.rootCenter.createChild("path")
#                   .moveTo(-11, 7)
#                   .lineTo(-9, -7)
#                   .moveTo(-9, -7)
#                   .lineTo(-9, -4)
#                   .moveTo(-9, -8)
#                   .lineTo(-11, -4)
#                   .setStrokeLineWidth(1)
#                   .setColor(1,0,0)
#                   .hide();
#        }
        rwr.symbol_launch = setsize([],rwr.max_icons);
        for (var i = 0;i<rwr.max_icons;i+=1) {
            rwr.symbol_launch[i] = rwr.rootCenter.createChild("path")
                    .moveTo(font*1.2, 0)
                    .arcSmallCW(font*1.2, font*1.2, 0, -font*2.4, 0)
                    .arcSmallCW(font*1.2, font*1.2, 0, font*2.4, 0)
                    .setStrokeLineWidth(1)
                    .setColor(colorG)
                    .hide();
        }
        rwr.symbol_new = setsize([],rwr.max_icons);
        for (var i = 0;i<rwr.max_icons;i+=1) {
            rwr.symbol_new[i] = rwr.rootCenter.createChild("path")
                    .moveTo(font*1.2, 0)
                    .arcSmallCCW(font*1.2, font*1.2, 0, -font*2.4, 0)
                    .setStrokeLineWidth(1)
                    .setColor(colorG)
                    .hide();
        }
#        rwr.symbol_16_lethal = setsize([],max_icons);
#        for (var i = 0;i<max_icons;i+=1) {
#           rwr.symbol_16_lethal[i] = rwr.rootCenter.createChild("path")
#                   .moveTo(10, 10)
#                   .lineTo(10, -10)
#                   .lineTo(-10,-10)
#                   .lineTo(-10,10)
#                   .lineTo(10, 10)
#                   .setStrokeLineWidth(1)
#                   .setColor(1,0,0)
#                   .hide();
#        }
        rwr.symbol_priority = rwr.rootCenter.createChild("path")
                    .moveTo(0, font*1.2)
                    .lineTo(font*1.2, 0)
                    .lineTo(0,-font*1.2)
                    .lineTo(-font*1.2,0)
                    .lineTo(0, font*1.2)
                    .setStrokeLineWidth(1)
                    .setColor(colorG)
                    .hide();
        
#        rwr.symbol_16_air = setsize([],max_icons);
#        for (var i = 0;i<max_icons;i+=1) {
 #          rwr.symbol_16_air[i] = rwr.rootCenter.createChild("path")
#                   .moveTo(15, 0)
#                   .lineTo(0,-15)
#                   .lineTo(-15,0)
#                   .setStrokeLineWidth(1)
#                   .setColor(1,0,0)
#                   .hide();
#        }
        rwr.AIRCRAFT_VIGGEN = "37";
        rwr.AIRCRAFT_EAGLE = "15";
        rwr.AIRCRAFT_TOMCAT = "14";
        rwr.AIRCRAFT_BUK = "11";
        rwr.AIRCRAFT_MIG21 = "21";
        rwr.AIRCRAFT_MIG29 = "29";
        rwr.AIRCRAFT_SU27 = "27";
        rwr.AIRCRAFT_MIRAGE = "20";
        rwr.AIRCRAFT_FALCON = "16";
        rwr.AIRCRAFT_WARTHOG = "10";
        rwr.AIRCRAFT_FRIGATE = "SH";
        #rwr.AIRCRAFT_TANKER = "KC";
        rwr.AIRCRAFT_AWACS = "S";
        rwr.AIRCRAFT_UNKNOWN = "U";
        rwr.AIRCRAFT_AI = "AI";
        rwr.lookupType = {
                "f-14b":                    rwr.AIRCRAFT_TOMCAT,     
                "F-14D":                    rwr.AIRCRAFT_TOMCAT,    
                "F-15C":                    rwr.AIRCRAFT_EAGLE,     
                "F-15D":                    rwr.AIRCRAFT_EAGLE,    
                "F-16":                     rwr.AIRCRAFT_FALCON,
        #        "YF-16":                    rwr.AIRCRAFT_FALCON,      
                "JA37-Viggen":              rwr.AIRCRAFT_VIGGEN,     
                "AJ37-Viggen":              rwr.AIRCRAFT_VIGGEN,     
                "AJS37-Viggen":             rwr.AIRCRAFT_VIGGEN,     
                "JA37Di-Viggen":            rwr.AIRCRAFT_VIGGEN,      
                "m2000-5":                  rwr.AIRCRAFT_MIRAGE,
                "m2000-5B":                 rwr.AIRCRAFT_MIRAGE,
                "MiG-21bis":                rwr.AIRCRAFT_MIG21,
                "buk-m2":                   rwr.AIRCRAFT_BUK,     
                "missile_frigate":          rwr.AIRCRAFT_FRIGATE,
                "frigate":                  rwr.AIRCRAFT_FRIGATE,
                "fleet":                    rwr.AIRCRAFT_FRIGATE, 
        #        "KC-137R":                  rwr.AIRCRAFT_TANKER,
        #        "KC-137R-RT":               rwr.AIRCRAFT_TANKER,
        #        "707-TT":                   rwr.AIRCRAFT_TANKER,
        #        "KC-30A":                   rwr.AIRCRAFT_TANKER,
        #        "Voyager-KC":               rwr.AIRCRAFT_TANKER,
        #        "KC-10A":                   rwr.AIRCRAFT_TANKER,
        #        "KC-10A-GE":                rwr.AIRCRAFT_TANKER,
                "EC-137R":                  rwr.AIRCRAFT_AWACS,
                "RC-137R":                  rwr.AIRCRAFT_AWACS,
                "E-8R":                     rwr.AIRCRAFT_AWACS,
                "EC-137D":                  rwr.AIRCRAFT_AWACS,
                "gci":                      rwr.AIRCRAFT_AWACS,
                "AI":                       rwr.AIRCRAFT_AI,
                #misc threatening aircraft:
                "MiG-29":                   rwr.AIRCRAFT_MIG29,
                "SU-27":                    rwr.AIRCRAFT_SU27,
        #        "ch53e":"53",
        #        "MQ-9":"9",
        #        "QF-4E":"F4",
        #        "B1-B":"B1",
                "A-10":                     rwr.AIRCRAFT_WARTHOG,
                "A-10-model":               rwr.AIRCRAFT_WARTHOG,
        #        "truck":"TR",
                "Typhoon":"EF",
                "f16":"16",
                "Mig-28":"28",
        #        "Tu-95MR":"95",
        #        "Tu-160-Blackjack":"BJ",
        #        "AN-225-Mrija":"AN",
                "Su-15":"SU",
                "Jaguar-GR3":"JG",
        };
        rwr.shownList = [];
        return rwr;
    },
    update: func (list) {
        #printf("list %d", size(list));
        me.elapsed = getprop("sim/time/elapsed-sec");
        var sorter = func(a, b) {
            if(a[1] > b[1]){
                return -1; # A should before b in the returned vector
            }elsif(a[1] == b[1]){
                return 0; # A is equivalent to b 
            }else{
                return 1; # A should after b in the returned vector
            }
        }
        me.sortedlist = sort(list, sorter);
        me.newList = [];
        me.i = 0;
        me.prio = 0;
        me.newsound = 0;
        me.unk = 0;
        foreach(me.contact; me.sortedlist) {
            me.typ=me.lookupType[me.contact[0].get_model()];
            if (me.i > me.max_icons-1) {
                break;
            }
            if (me.typ == nil) {
                me.typ = me.AIRCRAFT_UNKNOWN;
                continue;
                me.unk = 1;
            }
            #print("show "~me.i~" "~me.typ~" "~contact[0].get_model()~"  "~contact[1]);
            me.threat = me.contact[1];#print(me.threat);
            
            if (me.threat > 0.5 and me.typ != me.AIRCRAFT_UNKNOWN and me.typ != me.AIRCRAFT_AI) {
                me.threat = me.inner_radius;# inner circle
            } elsif (me.threat > 0) {
                me.threat = me.outer_radius;# outer circle
            } else {
                continue;
            }
            me.dev = -geo.normdeg180(me.contact[0].get_bearing()-getprop("orientation/heading-deg"))+90;
            me.x = math.cos(me.dev*D2R)*me.threat;
            me.y = -math.sin(me.dev*D2R)*me.threat;
            me.texts[me.i].setTranslation(me.x,me.y);
            me.texts[me.i].setText(me.typ);
            me.texts[me.i].show();
            if (me.prio == 0 and me.typ != me.AIRCRAFT_AI and me.typ != me.AIRCRAFT_UNKNOWN) {# 
                me.symbol_priority.setTranslation(me.x,me.y);
                me.symbol_priority.show();
                me.prio = 1;
            }
            if (!(me.typ == me.AIRCRAFT_BUK or me.typ == me.AIRCRAFT_FRIGATE) and me.contact[0].get_Speed()>60) {
                #air-borne
                me.symbol_hat[me.i].setTranslation(me.x,me.y);
                me.symbol_hat[me.i].show();
            } else {
                me.symbol_hat[me.i].hide();
            }
            if (me.contact[0].get_Callsign()==getprop("sound/rwr-launch") and 10*(me.elapsed-int(me.elapsed))>5) {#blink 2Hz
                me.symbol_launch[me.i].setTranslation(me.x,me.y);
                me.symbol_launch[me.i].show();
            } else {
                me.symbol_launch[me.i].hide();
            }
            me.popupNew = me.elapsed;
            foreach(me.old; me.shownList) {
                if(me.old[0].getUnique()==me.contact[0].getUnique()) {
                    me.popupNew = me.old[1];
                    break;
                }
            }
            if (me.popupNew == me.elapsed) {
                me.newsound = 1;
            }
            if (me.popupNew > me.elapsed-me.fadeTime) {
                me.symbol_new[me.i].setTranslation(me.x,me.y);
                me.symbol_new[me.i].show();
                me.symbol_new[me.i].update();
            } else {
                me.symbol_new[me.i].hide();
            }
            #printf("display %s %d",contact[0].get_Callsign(), me.threat);
            append(me.newList, [me.contact[0],me.popupNew]);
            me.i += 1;
        }
        me.shownList = me.newList;
        if (me.newsound == 1) setprop("sound/rwr-new", !getprop("sound/rwr-new"));
        for (;me.i<me.max_icons;me.i+=1) {
            me.texts[me.i].hide();
            me.symbol_hat[me.i].hide();
            me.symbol_new[me.i].hide();
            me.symbol_launch[me.i].hide();
        }
        if (me.prio == 0) {
            me.symbol_priority.hide();
        }
        setprop("sound/rwr-pri", me.prio);
        setprop("sound/rwr-unk", me.unk);
    },
};
var rwr = nil;
var cv = nil;
# var main_init_listener = setlistener("sim/signals/fdm-initialized", func {
#   if (getprop("sim/signals/fdm-initialized") == 1) {
#      var diam = 256;
#      cv = canvas.new({
#         "name": "Rwr",
#         "size": [diam,diam], 
#         "view": [diam,diam],
#         "mipmapping": 1
#     });  

# # #   cv.addPlacement({"node": "bkg", "texture":"rwr-bkg.png"});
#     cv.setColorBackground(0, 0.20, 0);
#     var root = cv.createGroup();
#     rwr = RWRCanvas.new(root, [diam/2,diam/2],diam);
#      removelistener(main_init_listener);
#   }
#  }, 0, 0);

var openDialog = func(){
   var diam = 256;
     cv = canvas.new({
        "name": "Rwr",
        "size": [diam,diam], 
        "view": [diam,diam],
        "mipmapping": 1
      });  
        
    cv.setColorBackground(0, 0.20, 0);
    var root = cv.createGroup();
    
    rwr = RWRCanvas.new(root, [diam/2,diam/2],diam);
  
  
  var window = canvas.Window.new([256,256],"Rwr");
  window.setCanvas(cv);
}
