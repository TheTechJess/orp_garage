Zones = {}
Zones.Garages = {

	-- ██████╗ ██╗   ██╗██████╗ ██╗     ██╗ ██████╗ 	 ██████╗  █████╗ ██████╗  █████╗  ██████╗ ███████╗███████╗
	-- ██╔══██╗██║   ██║██╔══██╗██║     ██║██╔════╝		██╔════╝ ██╔══██╗██╔══██╗██╔══██╗██╔════╝ ██╔════╝██╔════╝
	-- ██████╔╝██║   ██║██████╔╝██║     ██║██║     		██║  ███╗███████║██████╔╝███████║██║  ███╗█████╗  ███████╗
	-- ██╔═══╝ ██║   ██║██╔══██╗██║     ██║██║     		██║   ██║██╔══██║██╔══██╗██╔══██║██║   ██║██╔══╝  ╚════██║
	-- ██║     ╚██████╔╝██████╔╝███████╗██║╚██████╗		╚██████╔╝██║  ██║██║  ██║██║  ██║╚██████╔╝███████╗███████║
	-- ╚═╝      ╚═════╝ ╚═════╝ ╚══════╝╚═╝ ╚═════╝		 ╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝ ╚══════╝╚══════╝
	Garage_Centre = {
		label = 'Legion Square', -- label
		type = 'car', -- is it a car, boat, or aircraft garage?
		Job = 'public', -- is it a public garage or linked to a job?
		Zone = {
			Shape = {--polygon 
				vector2(240.04719543457, -820.8662109375),
				vector2(252.91648864746, -785.19812011719),
				vector2(258.59356689453, -787.25329589844),
				vector2(264.90390014648, -769.92639160156),
				vector2(218.50018310547, -754.24792480469),
				vector2(199.64559936523, -805.94781494141)
			},
			minZ = 29.00, 
			maxZ = 32.50, 
		},
		spawnpointers = {  -- looks for a spot for the vehicle to spawn
			[1] =			{ coords = vector3(221.97, -804.20, 30.66), heading = 249.68, radius = 3.0 }, -- Spot 1
			[2] =			{ coords = vector3(223.82, -799.21, 30.66), heading = 249.68, radius = 3.0 }, -- Spot 2
			[3] =			{ coords = vector3(226.59, -791.63, 30.66), heading = 249.68, radius = 3.0 }, -- Spot 3
			[4] =			{ coords = vector3(228.42, -786.49, 30.66), heading = 249.68, radius = 3.0 }, -- Spot 4
			[5] =			{ coords = vector3(231.42, -778.97, 30.66), heading = 249.68, radius = 3.0 }, -- Spot 5
			[6] =			{ coords = vector3(241.23, -782.50, 30.59), heading = 66.87, radius = 3.0 }, -- Spot 6
			[7] =			{ coords = vector3(238.64, -790.04, 30.59), heading = 66.87, radius = 3.0 }, -- Spot 7
			[8] =			{ coords = vector3(236.63, -795.12, 30.59), heading = 66.87, radius = 3.0 }, -- Spot 8
			[9] =			{ coords = vector3(233.90, -802.82, 30.59), heading = 66.87, radius = 3.0 }, -- Spot 9
			[10] =			{ coords = vector3(232.12, -807.90, 30.59), heading = 66.87, radius = 3.0 }, -- Spot 10
		},
	},

	Garage_VinewoodBowl = {
		label = 'Vinewood Bowl',
		Zone = {
			Shape = {
				vector2(665.15350341797, 627.57562255859),
				vector2(648.69976806641, 582.09197998047),
				vector2(583.8017578125, 605.70825195312),
				vector2(600.15496826172, 651.20050048828)
			},
			minZ = 128.00, 
			maxZ = 131.50, 
		},
		type = 'car', 
		Job = 'public',
		spawnpointers = {

		},
	},

	Garage_Centre2 = {
		label = 'Prosperity Garage', 
		Zone = {
			Shape = {
				vector2(-1526.3592529297, -451.07958984375),
				vector2(-1539.2478027344, -440.13500976562),
				vector2(-1540.5017089844, -434.73788452148),
				vector2(-1520.4749755859, -411.02233886719),
				vector2(-1504.947265625, -425.50842285156),
				vector2(-1506.2056884766, -438.33810424805)
			},
			minZ		= 34.00,
			maxZ		= 36.50
		},
		type = 'car', 
		Job = 'public',
		spawnpointers = {
			[1] =			{ coords = vector3(-1535.59, -434.61, 35.44), heading = 229.84, radius = 3.0 }, -- Spot 1
			[2] =			{ coords = vector3(-1533.21, -432.02, 35.44), heading = 229.84, radius = 3.0 }, -- Spot 2
			[3] =			{ coords = vector3(-1530.90, -429.52, 35.44), heading = 229.84, radius = 3.0 }, -- Spot 3
			[4] =			{ coords = vector3(-1526.44, -424.18, 35.44), heading = 229.84, radius = 3.0 }, -- Spot 4
			[5] =			{ coords = vector3(-1524.15, -421.64, 35.44), heading = 229.84, radius = 3.0 }, -- Spot 5
			[6] =			{ coords = vector3(-1521.93, -418.99, 35.44), heading = 229.84, radius = 3.0 }, -- Spot 6
			[7] =			{ coords = vector3(-1519.61, -416.39, 35.44), heading = 229.84, radius = 3.0 }, -- Spot 7
			[8] =			{ coords = vector3(-1509.00, -428.28, 35.44), heading = 84.74, radius = 3.0 }, -- Spot 8
			[9] =			{ coords = vector3(-1509.68, -431.70, 35.44), heading = 84.74, radius = 3.0 }, -- Spot 9
			[10] =			{ coords = vector3(-1509.81, -435.17, 35.44), heading = 84.74, radius = 3.0 }, -- Spot 10
		},
	},

	Garage_Paleto = {
		label = 'Paleto Garage', 
		Zone = {
			Shape = {
				vector2(105.03113555908, 6606.4165039062),
				vector2(147.83628845215, 6563.455078125),
				vector2(158.93579101562, 6586.6640625),
				vector2(156.41381835938, 6627.6044921875),
				vector2(140.61778259277, 6641.966796875)
			},
			minZ		= 30.50,
			maxZ		= 33.00
		},
		type = 'car', 
		Job = 'public',
		spawnpointers = {
			[1] =			{ coords = vector3(141.02, 6606.23, 31.84), heading = 179.00, radius = 3.0 }, -- Spot 1
			[2] =			{ coords = vector3(145.57, 6602.78, 31.84), heading = 179.00, radius = 3.0 }, -- Spot 2
			[3] =			{ coords = vector3(150.30, 6598.09, 31.84), heading = 179.00, radius = 3.0 }, -- Spot 3
			[4] =			{ coords = vector3(155.55, 6593.07, 31.84), heading = 179.00, radius = 3.0 }, -- Spot 4
			[5] =			{ coords = vector3(132.38, 6585.44, 31.84), heading = 271.13, radius = 3.0 }, -- Spot 5
			[6] =			{ coords = vector3(126.98, 6589.96, 31.84), heading = 271.13, radius = 3.0 }, -- Spot 6
			[7] =			{ coords = vector3(122.82, 6594.78, 31.84), heading = 271.13, radius = 3.0 }, -- Spot 7
			[8] =			{ coords = vector3(119.64, 6599.56, 31.84), heading = 271.13, radius = 3.0 }, -- Spot 8
		},
	},

	Garage_SandyShore = {
		label = 'Sandy Shore Garage', 
		Zone = {
			Shape = {
				vector2(1968.23, 3765.59),
				vector2(1971.20, 3774.29),
				vector2(1966.04, 3783.47),
				vector2(1940.19, 3767.86),
				vector2(1947.67, 3753.83)
			},
			minZ		= 31.20,
			maxZ		= 35.70
		},
		type = 'car', 
		Job = 'public',
		spawnpointers = {
			[1] =			{ coords = vector3(1962.98, 3766.37, 32.20), heading = 30.16, radius = 3.0 }, -- Spot 1
			[2] =			{ coords = vector3(1959.32, 3764.56, 32.20), heading = 30.16, radius = 3.0 }, -- Spot 2
			[3] =			{ coords = vector3(1955.83, 3762.49, 32.20), heading = 30.16, radius = 3.0 }, -- Spot 3
			[4] =			{ coords = vector3(1953.15, 3760.74, 32.20), heading = 30.16, radius = 3.0 }, -- Spot 4
			[5] =			{ coords = vector3(1949.47, 3759.11, 32.20), heading = 30.16, radius = 3.0 }, -- Spot 5
		},
	},

	Garage_Davis = {
		label = 'Davis St Garage', 
		Zone = {
			Shape = {
				vector2(-40.029163360596, -1732.0697021484),
				vector2(21.078636169434, -1779.4608154297),
				vector2(72.235176086426, -1718.2677001953),
				vector2(57.107528686523, -1706.4376220703),
				vector2(55.490329742432, -1708.5233154297),
				vector2(48.329105377197, -1702.1884765625),
				vector2(38.68314743042, -1706.4294433594),
				vector2(36.236473083496, -1699.9656982422)
			},
			minZ		= 28.00,
			maxZ		= 31.50
		},
		type = 'car', 
		Job = 'public',
		spawnpointers = {
			[1] =			{ coords = vector3(-3.50, -1747.51, 29.30), heading = 229.69, radius = 3.0 }, -- Spot 1
			[2] =			{ coords = vector3(-1.17, -1745.41, 29.30), heading = 229.69, radius = 3.0 }, -- Spot 2
			[3] =			{ coords = vector3(4.61, -1738.31, 29.30), heading = 229.69, radius = 3.0 }, -- Spot 3
			[4] =			{ coords = vector3(6.70, -1735.93, 29.30), heading = 229.69, radius = 3.0 }, -- Spot 4
			[5] =			{ coords = vector3(26.59, -1737.06, 29.30), heading = 50.38, radius = 3.0 }, -- Spot 5
			[6] =			{ coords = vector3(24.58, -1739.61, 29.30), heading = 50.38, radius = 3.0 }, -- Spot 6
			[7] =			{ coords = vector3(18.45, -1746.54, 29.30), heading = 50.38, radius = 3.0 }, -- Spot 7
			[8] =			{ coords = vector3(16.68, -1748.97, 29.30), heading = 50.38, radius = 3.0 }, -- Spot 8
			[9] =			{ coords = vector3(10.49, -1755.91, 29.30), heading = 50.38, radius = 3.0 }, -- Spot 9
			[10] =			{ coords = vector3(8.57, -1758.38, 29.30), heading = 50.38, radius = 3.0 }, -- Spot 10
		},
	},

	Garage_Vinewood = {
		label = 'Vinewood Garage', 
		Zone = {
			Shape = {
				vector2(615.19445800781, 73.497833251953),
				vector2(623.98083496094, 97.309776306152),
				vector2(626.66491699219, 95.901748657227),
				vector2(637.06372070312, 125.5735168457),
				vector2(607.14978027344, 136.90306091309),
				vector2(597.28582763672, 110.63410949707),
				vector2(599.57574462891, 109.81856536865),
				vector2(594.49310302734, 94.87712097168),
				vector2(599.26489257812, 92.463966369629),
				vector2(597.72576904297, 87.771125793457),
				vector2(594.34539794922, 88.488975524902),
				vector2(592.90930175781, 83.964775085449),
				vector2(602.23266601562, 80.906478881836),
				vector2(602.90185546875, 79.918113708496),
				vector2(602.54388427734, 78.858665466309),
				vector2(614.25793457031, 74.213249206543)
			},
			minZ		= 90.50,
			maxZ		= 95.50
		},
		type = 'car', 
		Job = 'public',
		spawnpointers = {
			[1] =			{ coords = vector3(608.37, 103.89, 92.82), heading = 69.45, radius = 3.0 }, -- Spot 1
			[2] =			{ coords = vector3(609.69, 107.45, 92.82), heading = 69.45, radius = 3.0 }, -- Spot 2
			[3] =			{ coords = vector3(610.95, 111.15, 92.82), heading = 69.45, radius = 3.0 }, -- Spot 3
			[4] =			{ coords = vector3(612.47, 114.88, 92.82), heading = 69.45, radius = 3.0 }, -- Spot 4
			[5] =			{ coords = vector3(613.81, 118.72, 92.82), heading = 69.45, radius = 3.0 }, -- Spot 5
			[6] =			{ coords = vector3(615.13, 122.65, 92.82), heading = 69.45, radius = 3.0 }, -- Spot 6
			[7] =			{ coords = vector3(623.75, 119.43, 92.68), heading = 69.45, radius = 3.0 }, -- Spot 7
			[8] =			{ coords = vector3(622.39, 115.58, 92.68), heading = 249.55, radius = 3.0 }, -- Spot 8
			[9] =			{ coords = vector3(620.95, 111.61, 92.68), heading = 69.45, radius = 3.0 }, -- Spot 9
			[10] =			{ coords = vector3(619.64, 107.98, 92.68), heading = 249.55, radius = 3.0 }, -- Spot 10
			[11] =			{ coords = vector3(618.34, 104.37, 92.68), heading = 249.55, radius = 3.0 }, -- Spot 11
			[12] =			{ coords = vector3(617.08, 100.89, 92.68), heading = 249.55, radius = 3.0 }, -- Spot 12
		},
	},

	Garage_Route68 = {
		label = 'Route 68 Garage', 
		Zone = {
			Shape = {
				vector2(-1154.53125, 2654.6528320312),
				vector2(-1159.4097900391, 2660.1127929688),
				vector2(-1161.8044433594, 2665.1357421875),
				vector2(-1164.5147705078, 2672.232421875),
				vector2(-1153.3336181641, 2682.3264160156),
				vector2(-1141.7416992188, 2685.2231445312),
				vector2(-1132.7604980469, 2674.0888671875)
			},
			minZ		= 16.50,
			maxZ		= 19.00
		},
		type = 'car', 
		Job = 'public',
		spawnpointers = {
			[1] =			{ coords = vector3(-1162.19, 2671.51, 18.09), heading = 217.93, radius = 3.0 }, -- Spot 1
			[2] =			{ coords = vector3(-1159.42, 2673.60, 18.09), heading = 217.93, radius = 3.0 }, -- Spot 2
			[3] =			{ coords = vector3(-1156.91, 2675.67, 18.09), heading = 217.93, radius = 3.0 }, -- Spot 3
			[4] =			{ coords = vector3(-1154.54, 2677.54, 18.09), heading = 217.93, radius = 3.0 }, -- Spot 4
			[5] =			{ coords = vector3(-1152.09, 2679.72, 18.09), heading = 217.93, radius = 3.0 }, -- Spot 5
		},
	},

	Garage_Ocean1 = {
		label = 'Ocean Garage', 
		Zone = {
			Shape = {
				vector2(-3169.1491699219, 1064.4364013672),
				vector2(-3141.7355957031, 1052.6143798828),
				vector2(-3137.3625488281, 1072.7086181641),
				vector2(-3129.4501953125, 1131.4287109375),
				vector2(-3137.0751953125, 1134.8656005859)
			},
			minZ		= 19.50,
			maxZ		= 22.00
		},
		type = 'car', 
		Job = 'public',
		spawnpointers = {
			[1] =			{ coords = vector3(-3139.29, 1082.70, 20.70), heading = 82.09, radius = 3.0 }, -- Spot 1
			[2] =			{ coords = vector3(-3138.85, 1086.87, 20.70), heading = 82.09, radius = 3.0 }, -- Spot 2
			[3] =			{ coords = vector3(-3138.17, 1090.81, 20.70), heading = 82.09, radius = 3.0 }, -- Spot 3
			[4] =			{ coords = vector3(-3137.53, 1094.63, 20.70), heading = 82.09, radius = 3.0 }, -- Spot 4
			[5] =			{ coords = vector3(-3137.03, 1098.65, 20.70), heading = 82.09, radius = 3.0 }, -- Spot 5
			[6] =			{ coords = vector3(-3136.46, 1102.71, 20.70), heading = 82.09, radius = 3.0 }, -- Spot 6
		},
	},

	Garage_Airport = {
		label = 'Airport Car Garage', 
		Zone = {
			Shape = {
				vector2(-915.21221923828, -2049.3786621094),
				vector2(-898.33850097656, -2032.4049072266),
				vector2(-879.18499755859, -2050.068359375),
				vector2(-939.72900390625, -2110.9802246094),
				vector2(-969.18286132812, -2111.1721191406),
				vector2(-973.36987304688, -2107.2312011719),
				vector2(-941.61407470703, -2075.5349121094),
				vector2(-935.376953125, -2081.9858398438),
				vector2(-909.14654541016, -2055.564453125)
			},
			minZ		= 8.00,
			maxZ		= 12.00
		},
		type = 'car', 
		Job = 'public',
		spawnpointers = {
			[1] =			{ coords = vector3(-940.98, -2078.91, 9.30), heading = 225.07, radius = 3.0 }, -- Spot 1
			[2] =			{ coords = vector3(-943.46, -2081.24, 9.30), heading = 225.07, radius = 3.0 }, -- Spot 2
			[3] =			{ coords = vector3(-945.9, -2083.69, 9.30), heading = 225.07, radius = 3.0 }, -- Spot 3
			[4] =			{ coords = vector3(-948.27, -2083.04, 9.30), heading = 225.07, radius = 3.0 }, -- Spot 4
			[5] =			{ coords = vector3(-950.68, -2088.53, 9.30), heading = 225.07, radius = 3.0 }, -- Spot 5
			[6] =			{ coords = vector3(-953.00, -2091.01, 9.30), heading = 225.07, radius = 3.0 }, -- Spot 6
			[7] =			{ coords = vector3(-955.51, -2093.44, 9.30), heading = 225.07, radius = 3.0 }, -- Spot 7
			[8] =			{ coords = vector3(-958.14, -2095.88, 9.30), heading = 225.07, radius = 3.0 }, -- Spot 8
			[9] =			{ coords = vector3(-960.44, -2098.39, 9.30), heading = 225.07, radius = 3.0 }, -- Spot 9
			[10] =			{ coords = vector3(-962.89, -2100.83, 9.30), heading = 225.07, radius = 3.0 }, -- Spot 10
			[11] =			{ coords = vector3(-965.36, -2103.19, 9.30), heading = 225.07, radius = 3.0 }, -- Spot 11
			[12] =			{ coords = vector3(-967.77, -2105.60, 9.30), heading = 225.07, radius = 3.0 }, -- Spot 12
			[13] =			{ coords = vector3(-970.07, -2107.93, 9.30), heading = 225.07, radius = 3.0 }, -- Spot 13
		},
	},

	Garage_Ocean2 = {
		label = 'Prosperity Garage', 
		Zone = {
			Shape = {
				vector2(-2229.5148925781, 4233.5083007812),
				vector2(-2223.7429199219, 4226.9145507812),
				vector2(-2216.1008300781, 4232.828125),
				vector2(-2217.2719726562, 4234.1577148438),
				vector2(-2209.3989257812, 4240.0913085938),
				vector2(-2210.3283691406, 4241.2802734375),
				vector2(-2202.1069335938, 4247.3447265625),
				vector2(-2196.7250976562, 4240.3647460938),
				vector2(-2189.4611816406, 4245.931640625),
				vector2(-2195.7993164062, 4253.958984375),
				vector2(-2185.0954589844, 4265.453125),
				vector2(-2197.166015625, 4272.2456054688),
				vector2(-2199.9228515625, 4267.5454101562),
				vector2(-2208.1545410156, 4259.4228515625),
				vector2(-2222.5881347656, 4245.7446289062)
			},
			minZ		= 45.00,
			maxZ		= 50.00
		},
		type = 'car', 
		Job = 'public',
		spawnpointers = {
			[1] =			{ coords = vector3(-2205.86, 4248.57, 47.55), heading = 37.96, radius = 3.0 }, -- Spot 1
			[2] =			{ coords = vector3(-2211.11, 4244.80, 47.55), heading = 37.96, radius = 3.0 }, -- Spot 2
			[3] =			{ coords = vector3(-2212.53, 4241.65, 47.55), heading = 37.96, radius = 3.0 }, -- Spot 3
			[4] =			{ coords = vector3(-2217.21, 4237.78, 47.55), heading = 37.96, radius = 3.0 }, -- Spot 4
			[5] =			{ coords = vector3(-2219.13, 4235.06, 47.55), heading = 37.96, radius = 3.0 }, -- Spot 5
			[6] =			{ coords = vector3(-2223.82, 4230.76, 47.55), heading = 37.96, radius = 3.0 }, -- Spot 6
		},
	},

	Garage_Lake = {
		label = 'Prosperity Garage', 
		Zone = {
			Shape = {
				vector2(-62.296573638916, 891.77197265625),
				vector2(-71.023468017578, 911.28552246094),
				vector2(-75.760025024414, 909.10681152344),
				vector2(-74.435920715332, 906.03436279297),
				vector2(-80.365364074707, 903.68762207031),
				vector2(-71.176216125488, 887.75549316406)
			},
			minZ		= 234.50,
			maxZ		= 236.50
		},
		type = 'car', 
		Job = 'public',
		spawnpointers = {
			[1] =			{ coords = vector3(-71.59, 903.14, 235.59), heading = 113.09, radius = 3.0 }, -- Spot 1
			[2] =			{ coords = vector3(-70.28, 900.32, 235.59), heading = 113.09, radius = 3.0 }, -- Spot 2
			[3] =			{ coords = vector3(-68.93, 987.63, 235.59), heading = 113.09, radius = 3.0 }, -- Spot 3
			[4] =			{ coords = vector3(-67.62, 894.86, 235.59), heading = 113.09, radius = 3.0 }, -- Spot 4
			[5] =			{ coords = vector3(-66.36, 892.03, 235.59), heading = 113.09, radius = 3.0 }, -- Spot 5
		},
	},

	Garage_LScustomp = {
		label = 'LS Customs', 
		Zone = {
			Shape = {
				vector2(-379.01281738282, -149.46801757812),
				vector2(-396.2370300293, -118.49282073974),
				vector2(-391.9652709961, -116.37184906006),
				vector2(-374.73852539062, -147.33465576172)
			},
			minZ		= 37.00,
			maxZ		= 40.50
		},
		type = 'car', 
		Job = 'public',
		spawnpointers = {
			[1] =			{ coords = vector3(-392.33, -118.80, 38.68), heading = 299.51, radius = 3.0 }, -- Spot 1
			[2] =			{ coords = vector3(-390.57, -121.80, 38.68), heading = 299.51, radius = 3.0 }, -- Spot 2
			[3] =			{ coords = vector3(-388.61, -124.67, 38.68), heading = 299.51, radius = 3.0 }, -- Spot 3
			[4] =			{ coords = vector3(-387.23, -128.04, 38.68), heading = 299.51, radius = 3.0 }, -- Spot 4
			[5] =			{ coords = vector3(-383.67, -134.04, 38.68), heading = 299.51, radius = 3.0 }, -- Spot 5
			[6] =			{ coords = vector3(-382.17, -137.20, 38.68), heading = 299.51, radius = 3.0 }, -- Spot 6
			[7] =			{ coords = vector3(-380.15, -140.13, 38.68), heading = 299.51, radius = 3.0 }, -- Spot 7
			[8] =			{ coords = vector3(-378.64, -143.37, 38.68), heading = 299.51, radius = 3.0 }, -- Spot 8
			[9] =			{ coords = vector3(-376.99, -146.42, 38.68), heading = 299.51, radius = 3.0 }, -- Spot 9
			[10] =			{ coords = vector3(-385.52, -131.14, 38.68), heading = 299.51, radius = 3.0 }, -- Spot 10
		},
	},

	Garage_LScustomp = {
		label = 'LS Customs', 
		Zone = {
			Shape = {
				vector2(-379.01281738282, -149.46801757812),
				vector2(-396.2370300293, -118.49282073974),
				vector2(-391.9652709961, -116.37184906006),
				vector2(-374.73852539062, -147.33465576172)
			},
			minZ		= 37.00,
			maxZ		= 40.50
		},
		type = 'car', 
		Job = 'public',
		spawnpointers = {
			[1] =			{ coords = vector3(-392.33, -118.80, 38.68), heading = 299.51, radius = 3.0 }, -- Spot 1
			[2] =			{ coords = vector3(-390.57, -121.80, 38.68), heading = 299.51, radius = 3.0 }, -- Spot 2
			[3] =			{ coords = vector3(-388.61, -124.67, 38.68), heading = 299.51, radius = 3.0 }, -- Spot 3
			[4] =			{ coords = vector3(-387.23, -128.04, 38.68), heading = 299.51, radius = 3.0 }, -- Spot 4
			[5] =			{ coords = vector3(-383.67, -134.04, 38.68), heading = 299.51, radius = 3.0 }, -- Spot 5
			[6] =			{ coords = vector3(-382.17, -137.20, 38.68), heading = 299.51, radius = 3.0 }, -- Spot 6
			[7] =			{ coords = vector3(-380.15, -140.13, 38.68), heading = 299.51, radius = 3.0 }, -- Spot 7
			[8] =			{ coords = vector3(-378.64, -143.37, 38.68), heading = 299.51, radius = 3.0 }, -- Spot 8
			[9] =			{ coords = vector3(-376.99, -146.42, 38.68), heading = 299.51, radius = 3.0 }, -- Spot 9
			[10] =			{ coords = vector3(-385.52, -131.14, 38.68), heading = 299.51, radius = 3.0 }, -- Spot 10
		},
	},

	Garage_Sunrise = {
		label = 'Sunrise Garage', 
		Zone = {
			Shape = {
				vector2(-784.26, -200.38),
				vector2(-790.79, -204.15),
				vector2(-799.66, -189.92),
				vector2(-793.53, -186.32)
			},
			minZ		= 36.28,
			maxZ		= 40.78
		},
		type = 'car', 
		Job = 'public',
		spawnpointers = {
			[1] =			{ coords = vector3(-793.41, -188.81, 37.28), heading = 299.55, radius = 3.0 }, -- Spot 1
			[2] =			{ coords = vector3(-791.62, -191.77, 37.28), heading = 299.55, radius = 3.0 }, -- Spot 2
			[3] =			{ coords = vector3(-789.15, -195.98, 37.28), heading = 299.55, radius = 3.0 }, -- Spot 3
			[4] =			{ coords = vector3(-787.37, -199.06, 37.28), heading = 299.55, radius = 3.0 }, -- Spot 4
		},
	},

	Garage_Zonah = {
		label = 'Mount Zonah Garage', 
		Zone = {
			Shape = {
				vector2(-474.56, -375.66),
				vector2(-457.26, -369.28),
				vector2(-454.06, -377.80),
				vector2(-470.81, -383.89)
			},
			minZ		= 23.23,
			maxZ		= 27.73
		},
		type = 'car', 
		Job = 'public',
		spawnpointers = {
			[1] =			{ coords = vector3(-458.36, -374.26, 24.23), heading = 20.13, radius = 3.0 }, -- Spot 1
			[2] =			{ coords = vector3(-462.16, -375.46, 24.23), heading = 20.13, radius = 3.0 }, -- Spot 2
			[3] =			{ coords = vector3(-465.63, -377.43, 24.23), heading = 20.13, radius = 3.0 }, -- Spot 3
			[4] =			{ coords = vector3(-469.77, -378.52, 24.23), heading = 20.13, radius = 3.0 }, -- Spot 4
		},
	},

	Garage_LastTrain = {
		label = 'Last Train Garage', 
		Zone = {
			Shape = {
				vector2(-352.87, 301.44),
				vector2(-352.26, 266.14),
				vector2(-339.57, 269.56),
				vector2(-338.32, 265.22),
				vector2(-332.57, 267.77),
				vector2(-332.44, 272.02),
				vector2(-325.58, 272.62),
				vector2(-325.76, 309.81),
				vector2(-339.48, 305.24),
			},
			minZ		= 83.76,
			maxZ		= 90.06
		},
		type = 'car', 
		Job = 'public',
		spawnpointers = {
			[1] =			{ coords = vector3(-349.1, 272.38, 85.13), heading = 266.93, radius = 3.0 }, -- Spot 1
			[2] =			{ coords = vector3(-349.1, 275.94, 85.05), heading = 266.93, radius = 3.0 }, -- Spot 2
			[3] =			{ coords = vector3(-340.77, 283.19, 85.42), heading = 93.48, radius = 3.0 }, -- Spot 3
			[4] =			{ coords = vector3(-349.1, 282.67, 84.96), heading = 266.93, radius = 3.0 }, -- Spot 4
			[5] =			{ coords = vector3(-349.1, 286.13, 84.97), heading = 266.93, radius = 3.0 }, -- Spot 5
			[6] =			{ coords = vector3(-349.1, 289.82, 84.97), heading = 266.93, radius = 3.0 }, -- Spot 6
			[7] =			{ coords = vector3(-340.77, 286.43, 85.45), heading = 93.48, radius = 3.0 }, -- Spot 7
			[8] =			{ coords = vector3(-349.1, 296.65, 84.97), heading = 266.93, radius = 3.0 }, -- Spot 8
			[9] =			{ coords = vector3(-340.77, 290.01, 85.46), heading = 93.48, radius = 3.0 }, -- Spot 9
			[10] =			{ coords = vector3(-340.77, 293.79, 85.46), heading = 93.48, radius = 3.0 }, -- Spot 10
		},
	},

	Garage_MRPDPublic = {
		label = 'MRPD Public Garage', 
		Zone = {
			Shape = {
				vector2(451.60192871094, -1028.050415039),
				vector2(433.9549255371, -1030.0822753906),
				vector2(433.37203979492, -1024.4034423828),
				vector2(451.05435180664, -1022.4908447266)
			},
			minZ		= 27.00,
			maxZ		= 32.50
		},
		type = 'car', 
		Job = 'public',
		spawnpointers = {
			[1] =			{ coords = vector3(435.32, -1026.2, 28.84), heading = 5.8, radius = 3.0 }, -- Spot 1
			[2] =			{ coords = vector3(438.68, -1025.12, 28.76), heading = 5.8, radius = 3.0 }, -- Spot 2
			[3] =			{ coords = vector3(442.56, -1024.72, 28.72), heading = 5.8, radius = 3.0 }, -- Spot 3
			[4] =			{ coords = vector3(445.8, -1024.4, 28.64), heading = 5.8, radius = 3.0 }, -- Spot 4
			[5] =			{ coords = vector3(449.52, -1024.04, 28.56), heading = 5.8, radius = 3.0 }, -- Spot 5
		},
	},


	Garage_SSPDPublic = {
		label = 'SSPD Public Garage', 
		Zone = {
			Shape = {
				vector2(1865.0, 3697.08),
				vector2(1862.0, 3702.16),
				vector2(1850.88, 3695.68),
				vector2(1843.68, 3706.84),
				vector2(1809.56, 3687.32),
				vector2(1813.84, 3680.48),
				vector2(1824.32, 3686.28),
				vector2(1825.76, 3683.96),
				vector2(1839.48, 3691.56),
				vector2(1843.76, 3683.92)
			},
			minZ		= 31.0,
			maxZ		= 40
		},
		type = 'car', 
		Job = 'public',
		spawnpointers = {
			[1] =			{ coords = vector3(1864.8, 3692.56, 33.24), heading = 120.59, radius = 3.0 }, -- Spot 1
			[2] =			{ coords = vector3(1863.16, 3695.92, 33.24), heading = 120.59, radius = 3.0 }, -- Spot 2
			[3] =			{ coords = vector3(1861.14, 3699.16, 33.24), heading = 120.59, radius = 3.0 }, -- Spot 3
			[4] =			{ coords = vector3(1846.88, 3686.28, 33.24), heading = 300.08, radius = 3.0 }, -- Spot 4
			[5] =			{ coords = vector3(1844.64, 3689.64, 33.24), heading = 300.08, radius = 3.0 }, -- Spot 5	
			[6] =			{ coords = vector3(1834.76, 3691.52, 33.72), heading = 30.6, radius = 3.0 }, -- Spot 6
			[7] =			{ coords = vector3(1831.4, 3689.56, 33.72), heading = 30.6, radius = 3.0 }, -- Spot 7
			[8] =			{ coords = vector3(1828.04, 3687.6, 33.72), heading = 30.6, radius = 3.0 }, -- Spot 8
			[9] =			{ coords = vector3(1825.0, 3685.44, 33.72), heading = 30.6, radius = 3.0 }, -- Spot 9
			[10] =			{ coords = vector3(1818.4, 3681.52, 33.72), heading = 30.6, radius = 3.0 }, -- Spot 10
			[11] =			{ coords = vector3(1814.96, 3679.92, 33.72), heading = 30.6, radius = 3.0 }, -- Spot 11
		},
	},

	Wallah_Parking = {
		label = 'Wallah Records Garage', 
		Zone = {
			Shape = {
				vector2(-845.16, -744.02),
				vector2(-843.90, -758.29),
				vector2(-843.80, -773.23),
				vector2(-807.36, -773.44),
				vector2(-807.11, -749.15)
			},
			minZ		= 19.88,
			maxZ		= 27.16
		},
		type = 'car', 
		Job = 'public',
		spawnpointers = {
			[1] =			{ coords = vector3(-841.48, -760.61, 21.88), heading = 270.00, radius = 3.0 }, -- Spot 1
			[2] =			{ coords = vector3(-840.99, -768.06, 21.16), heading = 270.00, radius = 3.0 }, -- Spot 2
			[3] =			{ coords = vector3(-822.28, -768.06, 21.16), heading = 270.00, radius = 3.0 }, -- Spot 3
			[4] =			{ coords = vector3(-822.28, -760.61, 21.88), heading = 270.00, radius = 3.0 }, -- Spot 4
			[5] =			{ coords = vector3(-829.50, -760.61, 21.88), heading = 90.00, radius = 3.0 }, -- Spot 5
			[6] =			{ coords = vector3(-829.50, -768.06, 21.16), heading = 90.00, radius = 3.0 }, -- Spot 6
			[7] =			{ coords = vector3(-810.00, -768.06, 21.16), heading = 90.00, radius = 3.0 }, -- Spot 7
			[8] =			{ coords = vector3(-810.00, -760.61, 21.88), heading = 90.00, radius = 3.0 }, -- Spot 8
		},
	},

	lamesa_public = {
		label = 'LaMesa PD Public Garage', 
		Zone = {
			Shape = {
				vector2(820.49444580078, -1274.6639404297),
				vector2(840.34106445312, -1274.5450439453),
				vector2(840.23937988281, -1268.7077636719),
				vector2(848.64813232422, -1268.7652587891),
				vector2(848.84057617188, -1264.3165283203),
				vector2(836.30059814453, -1255.1756591797),
				vector2(820.88195800781, -1255.0635986328)
			},
			minZ		= 19.88,
			maxZ		= 27.16
		},
		type = 'car', 
		Job = 'public',
		spawnpointers = {
			[1] =			{ coords = vector3(822.61346435547, -1257.8067626953, 26.247995376587), heading = 180.00, radius = 3.0 }, -- Spot 1
			[2] =			{ coords = vector3(827.93188476563, -1257.4379882813, 26.277505874634), heading = 180.00, radius = 3.0 }, -- Spot 2
			[3] =			{ coords = vector3(833.04608154297, -1257.5352783203, 26.330085754395), heading = 180.00, radius = 3.0 }, -- Spot 3
			[4] =			{ coords = vector3(838.32421875, -1272.3695068359, 26.2938232421888), heading = 355.00, radius = 3.0 }, -- Spot 4
			[5] =			{ coords = vector3(833.65875244141, -1272.2803955078, 26.276439666748), heading = 355.00, radius = 3.0 }, -- Spot 5
			[6] =			{ coords = vector3(828.44702148438, -1272.552734375, 26.264184951782), heading = 355.00, radius = 3.0 }, -- Spot 6
			[7] =			{ coords = vector3(822.87567138672, -1272.5213623047, 26.242259979248), heading = 355.00, radius = 3.0 } -- Spot 7
		},
	},
	player_shops = {
		label = 'player shop public garage', 
		Zone = {
			Shape = {
				vector2(-1211.7290039062, -1480.7939453125),
  vector2(-1185.5671386719, -1462.8859863281),
  vector2(-1167.7624511719, -1489.1300048828),
  vector2(-1167.0258789062, -1492.6964111328),
  vector2(-1167.9020996094, -1496.6064453125),
  vector2(-1170.3900146484, -1499.8731689453),
  vector2(-1173.6225585938, -1502.2042236328),
  vector2(-1176.7309570312, -1504.26171875),
  vector2(-1183.4865722656, -1507.8817138672),
  vector2(-1189.9383544922, -1510.7775878906)
			},
			minZ		= 3.38,
			maxZ		= 6.38
		},
		type = 'car', 
		Job = 'public',
		spawnpointers = {

		},
	},

	lamesa_shared = {
		label = 'LaMesa PD Shared Garage', 
		Zone = {
			Shape = {
				vector2(847.27557373046, -1328.0811767578),
				vector2(824.93481445312, -1328.057006836),
				vector2(824.93420410156, -1357.3182373046),
				vector2(847.23846435546, -1357.3914794922)
	  }, 
		minZ = 20.9,
		maxZ = 30.4
	  },
	  type = 'car', 
	  Job = 'police',
	  spawnpointers = {
		[1] =			{ coords = vector3(844.57, -1334.75, 25.39), heading = 61.52, radius = 3.0 }, -- Spot 1
		[2] =			{ coords = vector3(844.6, -1340.6, 25.76), heading = 61.52, radius = 3.0 }, -- Spot 2
		[3] =			{ coords = vector3(844.6, -1346.7, 25.36), heading = 61.52, radius = 3.0 }, -- Spot 3
		[4] =			{ coords = vector3(844.6, -1352.39, 25.37), heading = 61.52, radius = 3.0 }, -- Spot 4

		[5] =			{ coords = vector3(827.13, -1333.11, 25.39), heading = 25.38, radius = 3.0 }, -- Spot 5
		[6] =			{ coords = vector3(828.23, -1339.41, 25.38), heading = 25.38, radius = 3.0 }, -- Spot 6
		[7] =			{ coords = vector3(828.23, -1345.31, 25.76), heading = 25.38, radius = 3.0 }, -- Spot 7
		[8] =			{ coords = vector3(828.23, -1351.23, 25.38), heading = 25.38, radius = 3.0 }, -- Spot 8
	  },
	},


	--██████╗  ██████╗  █████╗ ████████╗ ███████╗  		 █████╗ ███╗   ██╗██████╗ 		██████╗ ██╗      █████╗ ███╗   ██╗███████╗███████╗
	--██╔══██╗██╔═══██╗██╔══██╗╚══██╔══╝ ██╔════╝  		██╔══██╗████╗  ██║██╔══██╗		██╔══██╗██║     ██╔══██╗████╗  ██║██╔════╝██╔════╝
	--██████╔╝██║   ██║███████║   ██║    ███████╗  		███████║██╔██╗ ██║██║  ██║		██████╔╝██║     ███████║██╔██╗ ██║█████╗  ███████╗
	--██╔══██╗██║   ██║██╔══██║   ██║    ╚════██║  		██╔══██║██║╚██╗██║██║  ██║		██╔═══╝ ██║     ██╔══██║██║╚██╗██║██╔══╝  ╚════██║
	--██████╔╝╚██████╔╝██║  ██║   ██║    ███████║  		██║  ██║██║ ╚████║██████╔╝		██║     ███████╗██║  ██║██║ ╚████║███████╗███████║
	--╚═════╝  ╚═════╝ ╚═╝  ╚═╝   ╚═╝    ╚══════╝  		╚═╝  ╚═╝╚═╝  ╚═══╝╚═════╝ 		╚═╝     ╚══════╝╚═╝  ╚═╝╚═╝  ╚═══╝╚══════╝╚══════╝

	BoatGarage_Centre = {
		label = 'Boat Garage', 
		Zone = {
			Shape = {
				vector2(-718.47912597656, -1314.8660888672),
				vector2(-693.44616699219, -1336.6516113281),
				vector2(-792.85125732422, -1452.7366943359),
				vector2(-808.04357910156, -1414.5509033203)
			},
			minZ		= -2.50,
			maxZ		= 3.50
		},
		type = 'boat', 
		Job = 'public',
		spawnpointers = {
		},
	},

	MTGordoBoatGarage = {
		label = 'MT Gordo Boat Garage', 
		Zone = {
			Shape = {
				vector2(3867.6555175781, 4462.0625),
				vector2(3859.7043457031, 4462.4111328125),
				vector2(3860.4287109375, 4475.9711914062),
				vector2(3874.2561035156, 4476.0576171875),
				vector2(3879.7163085938, 4476.0576171875),
				vector2(3882.7827148438, 4462.171875)
			},
			minZ		= -8.72,
			maxZ		= 5.72
		},
		type = 'boat', 
		Job = 'public',
		spawnpointers = {
		},
	},

	Airport_g = {
		label = 'Airport', 
		Zone = {
			Shape = {
				vector2(-1620.0928955078, -3144.4060058594),
				vector2(-1649.0920410156, -3185.2419433594),
				vector2(-1685.974609375, -3163.4765625),
				vector2(-1667.7647705078, -3117.052734375)
			},
			minZ		= 12.50,
			maxZ		= 15.50
		},
		type = 'aircraft', 
		Job = 'public',
		spawnpointers = {
		},
	},
  
	--     ██╗ ██████╗ ██████╗      ██████╗  █████╗ ██████╗  █████╗  ██████╗ ███████╗███████╗
	--     ██║██╔═══██╗██╔══██╗    ██╔════╝ ██╔══██╗██╔══██╗██╔══██╗██╔════╝ ██╔════╝██╔════╝
	--     ██║██║   ██║██████╔╝    ██║  ███╗███████║██████╔╝███████║██║  ███╗█████╗  ███████╗
	--██   ██║██║   ██║██╔══██╗    ██║   ██║██╔══██║██╔══██╗██╔══██║██║   ██║██╔══╝  ╚════██║
	--╚█████╔╝╚██████╔╝██████╔╝    ╚██████╔╝██║  ██║██║  ██║██║  ██║╚██████╔╝███████╗███████║
	-- ╚════╝  ╚═════╝ ╚═════╝      ╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝ ╚══════╝╚══════╝

	EMSGarageMZ = {
		label = 'Ambulace Garage', 
		Zone = {
			Shape = {
				vector2(-428.36389160156, -351.85391235352),
				vector2(-467.81332397461, -366.28012084961),
				vector2(-469.98025512695, -359.84078979492),
				vector2(-430.6833190918, -345.60333251953)
			},
			minZ		= 23.0,
			maxZ		= 28.80
		},
		type = 'car', 
		Job = 'ambulance',
		spawnpointers = {
		},
	},

	MZhelipad = {
		label = 'Mount Zonah Garage', 
		Zone = {
			Shape = {
				vector2(-450.26104736328, -319.26123046875),
				vector2(-463.34106445312, -288.50390625),
				vector2(-453.77648925781, -284.3291015625),
				vector2(-440.70938110352, -315.12557983398)
			},
			minZ		= 77.17,
			maxZ		= 82.17
		},
		type = 'aircraft', 
		Job = 'ambulance',
		spawnpointers = {
			[1] = 			{ coords = vector3(-451.12, -305.08, 78.17), heading = 22.66, radius = 3.0 }, -- Mz Heli spawn
		},
	},

	MRPDCar = {
		label = 'MRPD Garage', 
		Zone = {
			Shape = {
				vector2(447.90991210938, -1000.2854003906),
				vector2(447.93646240234, -984.6851196289),
				vector2(435.4880065918, -984.5687866211),
				vector2(435.34033203125, -1000.3820800782)
			},
			minZ		= 24.50,
			maxZ		= 27.80
		},
		type = 'car', 
		Job = 'police',
		spawnpointers = {
			[1] =			{ coords = vector3(445.52, -996.95, 25.32), heading = 90.0, radius = 3.0 }, -- Spot 1
			[2] =			{ coords = vector3(445.52, -994.27, 25.32), heading = 90.0, radius = 3.0 }, -- Spot 2
			[3] =			{ coords = vector3(445.52, -991.56, 25.32), heading = 90.0, radius = 3.0 }, -- Spot 3
			[4] =			{ coords = vector3(445.52, -998.84, 25.32), heading = 90.0, radius = 3.0 }, -- Spot 4
			[5] =			{ coords = vector3(445.52, -986.13, 25.32), heading = 90.0, radius = 3.0 }, -- Spot 5
			[6] =			{ coords = vector3(437.31, -986.13, 25.32), heading = 269.0, radius = 3.0 }, -- Spot 6
			[7] =			{ coords = vector3(437.31, -998.84, 25.32), heading = 269.0, radius = 3.0 }, -- Spot 7
			[8] =			{ coords = vector3(437.31, -991.56, 25.32), heading = 269.0, radius = 3.0 }, -- Spot 8
			[9] =			{ coords = vector3(437.31, -994.27, 25.32), heading = 269.0, radius = 3.0 }, -- Spot 9
			[10] =			{ coords = vector3(437.31, -996.95, 25.32), heading = 269.0, radius = 3.0 }, -- Spot 10
		},
	},

	MRPDHeli = {
		label = 'MRPD Garage', 
		Zone = {
			Shape = {
				vector2(454.89819335938, -986.42572021484),
				vector2(444.04016113281, -986.56842041016),
				vector2(443.94424438477, -975.68078613281),
				vector2(454.74508666992, -975.58843994141)
			},
			minZ		= 42.00,
			maxZ		= 52.00
		},
		type = 'aircraft', 
		Job = 'police',
		spawnpointers = {
			[1] =			{ coords = vector3(449.3, -981.18, 43.69), heading = 180.0, radius = 3.0 },
		},
	},

	SSPDHeli = {
		label = 'SSPD Garage', 
		Zone = {
			Shape = {
				vector2(1851.84, 3699.48),
				vector2(1860.28, 3704.36),
				vector2(1855.12, 3713.28),
				vector2(1846.96, 3707.96)
			},
			minZ		= 31.0,
			maxZ		= 40
		},
		type = 'aircraft', 
		Job = 'police',
		spawnpointers = {
			[1] =			{ coords = vector3(1853.28, 3706.48, 33.97), heading = 29.0, radius = 3.0 },
		},
	},

	lscustom_mgarage = {
		label = 'LS Custom Job Garage', 
		Zone = {
			Shape = {
				vector2(-351.31155395508, -162.70550537109),
				vector2(-356.58654785156, -165.74452209473),
				vector2(-360.83184814453, -158.38806152344),
				vector2(-355.60317993164, -155.28060913086)
			},
			minZ		= 38.00,
			maxZ		= 43.50
		},
		type = 'car', 
		Job = 'lscustom',
		spawnpointers = {
			[1] =			{ coords = vector3(-356.77, -160.66, 38.82), heading = 28.97, radius = 3.0 } -- Spot 1..
		},
	},




	--██╗███╗   ███╗██████╗  ██████╗ ██╗   ██╗███╗   ██╗██████╗ 
	--██║████╗ ████║██╔══██╗██╔═══██╗██║   ██║████╗  ██║██╔══██╗
	--██║██╔████╔██║██████╔╝██║   ██║██║   ██║██╔██╗ ██║██║  ██║ 
	--██║██║╚██╔╝██║██╔═══╝ ██║   ██║██║   ██║██║╚██╗██║██║  ██║
	--██║██║ ╚═╝ ██║██║     ╚██████╔╝╚██████╔╝██║ ╚████║██████╔╝
	--╚═╝╚═╝     ╚═╝╚═╝      ╚═════╝  ╚═════╝ ╚═╝  ╚═══╝╚═════╝

	impoundlot = {
		label = 'IMPOUND', 
		Zone = {
			Shape = {
				vector2(405.91906738281, -1617.0904541016),
				vector2(391.86907958984, -1604.7502441406),
				vector2(378.86584472656, -1619.4813232422),
				vector2(394.57141113281, -1631.234375)
			},
			minZ		= 28.00,
			maxZ		= 31.50
		},
		type = 'car', 
		Job = 'impound',
		spawnpointers = {
		},
	},


}



Zones.JobImpound = {
	impounddrop = {
		Zone = {
			Shape = {
				vector2(393.59381103516, -1634.7686767578),
				vector2(400.38989257812, -1640.3666992188),
				vector2(409.45947265625, -1629.5090332031),
				vector2(402.51043701172, -1623.896484375)
			},
			minZ		= 28.00,
			maxZ		= 31.50
		},
	},

}


