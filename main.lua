-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

-- Your code here

local image = display.newImageRect("background.png",350,350)
image.x = display.contentCenterX
image.y = display.contentCenterY

local rect = display.newRect(17,100,30,50)
rect:setFillColor(1,1,1,0)

local myrect = display.newRect(17,100,30,50)
myrect:setFillColor(1,1,1,0)

local mytext = display.newText("老虎机",display.contentCenterX,display.contentCenterY/5,nil,25)

rect.strokeWidth = 3
rect:setStrokeColor(1,1,1)

myrect.strokeWidth = 4
myrect:setStrokeColor( 1, 0, 0 )
--myrect.alpha = 0.8
lastrandom = 0
random = 0
mybol = 0
reverse =1
count = 36
rand = 0
local myrectX = myrect.x
local myrectY = myrect.y
function left()
	-- body
	--print("random: ".. random)
	
	if(mybol==lastrandom) then
		mybol=0
	end
	lastrandom = random
	mybol = mybol +1
	--print(mybol)
	if ( reverse <9 and reverse >=1) then
        reverse =reverse + 1
        transition.to( myrect, { x = myrectX+count, time=10, transition=easing.inOutCubic } )
        myrectX = myrectX+count
 
    elseif (reverse>=9 and reverse<13) then
        reverse = reverse+1
        transition.to(myrect, { y = myrectY+58, time=10 , transition=easing.inOutCubic})
        myrectY = myrectY+58

        elseif (reverse>=13 and reverse<21 ) then 
        	reverse = reverse+1
        	transition.to( myrect, { x = myrectX-count, time=10, transition=easing.inOutCubic } )
        	myrectX = myrectX-count

        	elseif(reverse>=21) then 
        		reverse= reverse+1
        		transition.to(myrect, { y = myrectY-58, time=10,transition=easing.inOutCubic})
        		myrectY = myrectY-58
        		if(reverse>=25) then 
        			reverse=1
        		end
    end
end

local function myTouchListener( event )
	if(mybol == 0 or mybol == lastrandom) then
		if(event.phase == "ended") then
		random = math.random(50,150)
        --print("mybol: ".. mybol)
        --print("lastrandom: "..lastrandom)
        --print(random.."hello")
        timer.performWithDelay(40, left, random)
        end
    end
    return true
end

local button = display.newImage("start.png",display.contentCenterX-13,396)
button:addEventListener("touch",myTouchListener)



