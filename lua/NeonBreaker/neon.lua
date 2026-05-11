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
BALL_START_SPEED = .25
BALL_START_SIZE = 2

table.insert(balls, {x=96, y=24, dx=-BALL_START_SPEED, dy=BALL_START_SPEED,  r=BALL_START_SIZE})
table.insert(balls, {x=6, y=4, dx=BALL_START_SPEED, dy=-BALL_START_SPEED, r=BALL_START_SIZE})


PADDEL_START_SPEED = 2
PADDEL_START_SIZE = 16
PADDEL_START_HEIGHT = 5
PADDEL_START_Y = 120
PADDEL_START_X = 60

paddel = {x=PADDEL_START_X, y=PADDEL_START_Y, w=PADDEL_START_SIZE, h=PADDEL_START_HEIGHT, s=PADDEL_START_SPEED}

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
		ball.x=ball.x+ball.dx
		ball.y=ball.y+ball.dy
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
		if ball.y+ball.r>paddel.y and ball.y<paddel.y+paddel.h and ball.x+ball.r>paddel.x and ball.x<paddel.x+paddel.w then
			ball.dy=-ball.dy
			-- move the ball above the paddel to avoid multiple collision
			ball.y=paddel.y-ball.r
		end
	end
end

function draw()
	cls(13)
	rect(0,0,136,136,14)
	draw_balls()
	draw_paddel()
	-- print("balls: "..#balls, 2, 2, 12)
end

function draw_paddel()
	rect(paddel.x, paddel.y, paddel.w, paddel.h, 12)
	circ(paddel.x, paddel.y+2, 2, 12)
	circ(paddel.x+paddel.w, paddel.y+2, 2, 12)
end
function draw_balls()
	for i, ball in ipairs(balls) do
		-- spr(0, ball.x, ball.y, 0)
		circ(ball.x, ball.y, ball.r, 12)
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

