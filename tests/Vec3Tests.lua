-----------------------------
-- Setup
-----------------------------

require "testkit.Unit"

local coOsg = require "coOsg"

local v1
local v2
local expected

-----------------------------
-- Vec3 Tests
-----------------------------

function multiplyVectorByScalarTest()
	local scalar = 2.0
	v1 = coOsg.Vec3( 2.0, 0.0, 1.0 )
	expected = coOsg.Vec3( v1.x * scalar, v1.y * scalar, v1.z * scalar )
	v1:mulScalar( scalar )
	compareVec3( v1, expected )
end

function addTwoVectorsTest()
	v1 = coOsg.Vec3( 1.0, 0.0, 1.0 )
	v2 = coOsg.Vec3( 1.0, -1.0, 2.0 )
	expected = coOsg.Vec3( v1.x + v2.x, v1.y + v2.y, v1.z + v2.z )
	v1:add( v2 )
	compareVec3( v1, expected )
end

function subtractTwoVectorsTest()
	v1 = coOsg.Vec3( 1.0, 0.0, -1.0 )
	v2 = coOsg.Vec3( 1.0, 1.0, 2.0 )
	expected = coOsg.Vec3( v1.x - v2.x, v1.y - v2.y, v1.z - v2.z )
	v1:sub( v2 )
	compareVec3( v1, expected )
end

function crossProductTest()
	v1 = coOsg.Vec3( 1.0, 0.0, 0.0 )
	v2 = coOsg.Vec3( 0.0, 1.0, 0.0 )
	expected = coOsg.Vec3( v1.y * v2.z - v1.z * v2.y, v1.z * v2.x - v1.x * v2.z, v1.x * v2.y - v1.y * v2.x )
	v1:cross( v2 )
	compareVec3( v1, expected )
end

function dotProductTest()
	v1 = coOsg.Vec3( 1.0, 2.0, 3.0 )
	v2 = coOsg.Vec3( 1.0, 0.0, 1.0 )
	expected = v1.x * v2.x + v1.y * v2.y + v1.z * v2.z
	ASSERT_DOUBLE_EQ( v1:dot( v2 ), expected, "The result of dot product is " .. v1:dot( v2 ) .. " when the expected is " .. expected )
end

function verifyEqualityBetweenTwoVectorsTest()
	v1 = coOsg.Vec3( 1.0, 0.0, 0.0 )
	v2 = coOsg.Vec3( 1.0, 0.0, 0.0 )
	ASSERT_TRUE( v1:equals( v2 ) == true, "The vectors are not equals" )
end

function vectorLengthTest()
	v1 = coOsg.Vec3( 1.0, 2.0, 1.0 )
	expected = math.sqrt( v1.x * v1.x + v1.y + v1.y + v1.z * v1.z );
	ASSERT_DOUBLE_EQ( v1:length(), expected, "The length of vector is " .. v1:length() .. " when the expected is " .. expected )
end

function vectorNormalizeTest()
	v1 = coOsg.Vec3( 2.0, 1.0, 2.0 )
	local length = math.sqrt( v1.x * v1.x + v1.y * v1.y + v1.z * v1.z );
	expected = coOsg.Vec3( v1.x / length, v1.y / length, v1.z / length )
	v1:normalize()
	compareVec3WithTolerance( v1, expected )
end
