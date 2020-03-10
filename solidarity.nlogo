;; This program requires POVRay to correctly give the rendering effects, but the code can be used without
;; the extension. This work is licensed under Attribution-ShareAlike 4.0 International and the video can be found
;; at http://www.youtube.com/watch?v=AYLt9WfwJ-c&. Please message me for a link to the textures.

extensions [ raytracing ]

to setup
  
  clear-all
  
  orbit-down 90
  zoom 38
  raytracing:clear-lights
  raytracing:add-light 0 -10 0 red
  raytracing:add-light 0 0 10 white
  raytracing:add-light -10 0 0 white
  raytracing:add-light 0 -25 0 white
  raytracing:add-light 0 -25 0 white
  
  create-ordered-turtles 1 [ ;sun
    
    set color yellow ; temp until textures are added
    set shape "circle"
    raytracing:set-image "sun.jpg"
    set size 10
    fd -11.5
    
  ]
  
  create-ordered-turtles 1 [ ;mercury tagged turtle 1
    
    set color red
    set shape "circle"
    raytracing:set-image "mercury.jpg"
    set size 0.383
    fd -6
    right 30
    
  ]
  
  create-ordered-turtles 1 [ ;venus tagged turtle 2
    
    set color brown
    set shape "circle"
    raytracing:set-image "venus.jpg"
    set size 0.949
    fd -5
    right 30
    
  ]
  
  create-ordered-turtles 1 [ ;earth tagged turtle 3
    
    set color blue
    set shape "circle"
    raytracing:set-image "earth.jpg"
    set size 1
    fd -3
    right 30
    
  ]
  
  create-ordered-turtles 1 [ ;mars tagged turtle 4
    
    set color brown
    set shape "circle"
    raytracing:set-image "mars.jpg"
    set size 0.532
    fd -1
    right 30
    
  ]
    
  create-ordered-turtles 1 [ ;jupiter tagged turtle 5
    
    set color orange
    set shape "circle"
    raytracing:set-image "jupiter.jpg"
    set size 4.21
    fd 3
    right 30
    
  ]
  
  create-ordered-turtles 1 [ ;saturn tagged turtle 6
    
    set color white
    set shape "circle"
    raytracing:set-image "saturn.jpg"
    set size 3.45
    fd 7
    right 30
    
  ]
  
  create-ordered-turtles 1 [ ;uranus tagged turtle 7
    
    set color cyan
    set shape "circle"
    raytracing:set-image "uranus.jpg"
    set size 2.01
    fd 10
    right 30
    
  ]
  
  create-ordered-turtles 1 [ ;neptune tagged turtle 8
    
    set color blue
    set shape "circle"
    raytracing:set-image "neptune.jpg"
    set size 1.88
    fd 13
    right 30
    
  ]
  
end

to ray
  
  raytracing:output-resolution 1280 720
  raytracing:render "solar" 10
  
end

to movie
  
  let tNum 0
  let zoomLevel 20
  
  raytracing:output-resolution 1280 720
  ;; NOTE: If you're creating a bunch of movie frames, it's usually better
  ;; to put them in a subfolder, so create a subfolder called "frames"
  ;; and change the line below to:
  ;; raytracing:start-movie "testmovie" 10
  raytracing:start-movie "/tmp/blaiseTMP/frame" 10

  repeat 9 [
     ;show tNum
     ;show turtle tNum
     ask turtle tNum [
       repeat 360 [
         right 1
         display ;;wait 0.05
         raytracing:render-next-movie-frame
       ]
       if zoomLevel > 3 [ ;sets zoom to 20 since the sun is so big, but zoom only needs to be 3 after
         set zoomLevel zoomLevel - 17
       ]
       if tNum < 9 [ ;failsafe
         set tNum tNum + 1
       ]
       if tNum < 1 [ ;moves the sun back so that the lights get swallowed
         back 10
       ]
       die
     ]
     zoom zoomLevel
  ]
     
end
