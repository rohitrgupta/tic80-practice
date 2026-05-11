-- title:   Neon Breaker
-- author:  game developer, email, etc.
-- desc:    short description
-- site:    website link
-- license: MIT License (change this to your license of choice)
-- version: 0.1
-- script:  lua

-- TODO
-- create the start project +Neon
-- create ball and paddel sprite
-- Show ball move the ball and bounce it from the walls
-- Show paddel and move it using left and right key
-- move the ball using the speed variable

t=0
balls = {}
BALL_START_SPEED = 0.1
BALL_START_SIZE = 2

-- table.insert(balls, {x=40, y=110, dx=BALL_START_SPEED, dy=BALL_START_SPEED,  r=BALL_START_SIZE})
--table.insert(balls, {x=43, y=110, dx=BALL_START_SPEED, dy=BALL_START_SPEED,  r=BALL_START_SIZE, c=2})
--table.insert(balls, {x=45, y=110, dx=BALL_START_SPEED, dy=BALL_START_SPEED,  r=BALL_START_SIZE, c=3})
--table.insert(balls, {x=47, y=110, dx=BALL_START_SPEED, dy=BALL_START_SPEED,  r=BALL_START_SIZE, c=4})
table.insert(balls, {x=49, y=110, dx=BALL_START_SPEED, dy=BALL_START_SPEED,  r=BALL_START_SIZE, c=5})
 table.insert(balls, {x=50, y=110, dx=BALL_START_SPEED, dy=BALL_START_SPEED,  r=BALL_START_SIZE, c=6})
--table.insert(balls, {x=51, y=110, dx=BALL_START_SPEED, dy=BALL_START_SPEED,  r=BALL_START_SIZE, c=7})


--table.insert(balls, {x=63, y=110, dx=BALL_START_SPEED, dy=BALL_START_SPEED,  r=BALL_START_SIZE, c=2})
--table.insert(balls, {x=65, y=110, dx=BALL_START_SPEED, dy=BALL_START_SPEED,  r=BALL_START_SIZE, c=3})
--table.insert(balls, {x=67, y=110, dx=BALL_START_SPEED, dy=BALL_START_SPEED,  r=BALL_START_SIZE, c=4})
-- table.insert(balls, {x=70, y=110, dx=BALL_START_SPEED, dy=BALL_START_SPEED,  r=BALL_START_SIZE, c=5})
-- table.insert(balls, {x=71, y=110, dx=BALL_START_SPEED, dy=BALL_START_SPEED,  r=BALL_START_SIZE, c=6})

-- table.insert(balls, {x=50, y=110, dx=BALL_START_SPEED, dy=BALL_START_SPEED,  r=BALL_START_SIZE})
-- table.insert(balls, {x=55, y=110, dx=BALL_START_SPEED, dy=BALL_START_SPEED,  r=BALL_START_SIZE})
-- table.insert(balls, {x=60, y=110, dx=BALL_START_SPEED, dy=BALL_START_SPEED,  r=BALL_START_SIZE})


-- table.insert(balls, {x=6, y=4, dx=BALL_START_SPEED, dy=-BALL_START_SPEED, r=BALL_START_SIZE})


PADDEL_START_SPEED = 2
PADDEL_START_SIZE = 16
PADDEL_START_HEIGHT = 5
PADDEL_START_Y = 120
PADDEL_START_X = 60

paddel = {x=PADDEL_START_X, y=PADDEL_START_Y, w=PADDEL_START_SIZE, h=PADDEL_START_HEIGHT, s=PADDEL_START_SPEED}

rect(0,0,136,136,14)

function TIC()
 update()
 draw()
end

function update()
	t=t+1
	handle_input()
	move_balls()
end

function handle_input()
	if btn(2) then
		paddel.x=paddel.x-paddel.s
		if paddel.x<2 then
			paddel.x=2
		end
	end
	if btn(3) then
		paddel.x=paddel.x+paddel.s
		if paddel.x>136-paddel.w-3 then
			paddel.x=136-paddel.w-3
		end
	end

end

function move_balls()
	for i, ball in ipairs(balls) do
		-- check if ball is colliding with top of the paddel 
		local old_x=ball.x
		local old_y=ball.y
		ball.x=ball.x+ball.dx
		ball.y=ball.y+ball.dy
		-- ball is moving down and its bottom will cross the top of the paddel
		if old_y + ball.r <= paddel.y and ball.y + ball.r >= paddel.y then
		-- find the x position of the ball when its bottom is at the same y as the top of the paddel
			intersect_x = old_x + (paddel.y - old_y - ball.r) * ball.dx / ball.dy
			if intersect_x >= paddel.x - ball.r and intersect_x <= paddel.x + paddel.w + ball.r then
				ball.dy=-ball.dy
				remaining_y = ball.y + ball.dy - paddel.y - ball.r
				ball.y=paddel.y+remaining_y
			end
		end
		-- ball is moving right and its right will cross the left of the paddel
		--rect(0,0,136,8,15)
		local l= old_x + ball.r<=paddel.x
		if l then
		 rect(0,0,50,8, 15)
			print(t .. " ".. old_x, 0,0,12)
		end
		local r = ball.x + ball.r >= paddel.x
		--trace("o"..old_x + ball.r)
		--trace(l)
		--trace(r)
		if not r then
			rect(50,0,100,8, 15)
			print(t.. " "..ball.x, 50, 0,12)
		end
		if old_x + ball.r <= paddel.x and ball.x + ball.r >= paddel.x then
			print("crossing left"..t, 0,8,12)
			intersect_y = old_y + (paddel.x - old_x - ball.r) * ball.dy / ball.dx
			if intersect_y >= paddel.y - ball.r and intersect_y <= paddel.y + paddel.h + ball.r then
				print("collide "..t, 0,16,12)
				ball.dx=-ball.dx
				remaining_x = ball.x + ball.r - paddel.x
				ball.x=paddel.x-remaining_x
			end
		end


		if ball.x<ball.r then
			ball.x=ball.r
			ball.dx=-ball.dx
		end
		if ball.x>136-ball.r then
			ball.x=136-ball.r
			ball.dx=-ball.dx	
		end
		if ball.y<ball.r then
			ball.y=ball.r
			ball.dy=-ball.dy
		end
		if ball.y>136-ball.r then
			-- remove ball from balls
			table.remove(balls, i)
			-- ball.y=136
			-- ball.dy=-ball.dy
		end
	end
end

function draw()
	-- cls(13)
	-- rect(0,0,136,136,14)
	draw_balls()
	draw_paddel()
	-- print("balls: "..#balls, 2, 2, 12)
end

function draw_paddel()
	rect(paddel.x, paddel.y, paddel.w, paddel.h, 12)
	-- circ(paddel.x, paddel.y+2, 2, 12)
	-- circ(paddel.x+paddel.w, paddel.y+2, 2, 12)
end
function draw_balls()
	for i, ball in ipairs(balls) do
		-- spr(0, ball.x, ball.y, 0)
		 circ(ball.x, ball.y, ball.r, ball.c)
		--pix(ball.x, ball.y, ball.c)
	end
end
-- <TILES>
-- 000:0044000004c440004c4444004444440004444000004400000000000000000000
-- 001:0005555500555555005555550006666600000000000000000000000000000000
-- 002:5555555555555555555555556666666600000000000000000000000000000000
-- 003:5555500055555500555555006666600000000000000000000000000000000000
-- </TILES>

-- <WAVES>
-- 000:00000000ffffffff00000000ffffffff
-- 001:0123456789abcdeffedcba9876543210
-- 002:0123456789abcdef0123456789abcdef
-- </WAVES>

-- <SFX>
-- 000:000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000304000000000
-- </SFX>

-- <TRACKS>
-- 000:100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
-- </TRACKS>

-- <PALETTE>
-- 000:1a1c2c5d275db13e53ef7d57ffcd75a7f07038b76425717929366f3b5dc941a6f673eff7f4f4f494b0c2566c86333c57
-- </PALETTE>

