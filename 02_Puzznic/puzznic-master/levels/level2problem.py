import sys
import os
import json

def initColorList(tilesetColors):
	colors = {}
	for color in tilesetColors:
		if(color != 'stage'):
			colors[color] = []
	
	return colors


def parseTarget(config, target):
	tilemap = target['layers'][0]
	tilesetColors = config['tilesetColors']
	blocksQuantity = len(tilemap['data'])

	colors = initColorList(tilesetColors)
	blocks = []

	for y in range(tilemap['height']):
		for x in range(tilemap['width']):
			currentIndex = x + y * tilemap['width']
			currentBlock = tilemap['data'][currentIndex]

			block = {
				'surroundingBlocks': {},
				'isMatchingBlock': False
			}

			if(currentBlock == 0):
				block['empty'] = True
			elif(tilesetColors[currentBlock - 1] == 'stage'):
				block['immovable'] = True
			else:
				colors[tilesetColors[currentBlock - 1]].append(currentIndex)
				block['isMatchingBlock'] = True

			left = (x - 1) + y * tilemap['width']
			up = x + (y - 1) * tilemap['width']
			right = (x + 1) + y * tilemap['width']
			down = x + (y + 1) * tilemap['width']

			if(left >= 0):
				block['surroundingBlocks']['left'] = left
			if(up >= 0):
				block['surroundingBlocks']['up'] = up
			if(right < blocksQuantity):
				block['surroundingBlocks']['right'] = right
			if(down < blocksQuantity):
				block['surroundingBlocks']['down'] = down
			
			blocks.append(block)

	return { "blocks": blocks, "colors": colors }

def generateOutput(parsedTarget, inputName):
	objects = ''
	init = ''
	goal = ''

	for index, block in enumerate(parsedTarget['blocks']):
		if(block['isMatchingBlock']):
			objects += 'block{} - matching-block '.format(index)
		elif('immovable' in block):
			objects += 'block{} - immovable-block '.format(index)
			init += '\t(is-immovable block{})\n'.format(index)
		else:
			objects += 'block{} - movable-block '.format(index)
		
		if('empty' in block):
			init += '\t(is-empty block{})\n'.format(index)

		if('left' in block['surroundingBlocks']):
			init += '\t(left block{} block{})\n'.format(index, block['surroundingBlocks']['left'])
		if('up' in block['surroundingBlocks']):
			init += '\t(up block{} block{})\n'.format(index, block['surroundingBlocks']['up'])
		if('right' in block['surroundingBlocks']):
			init += '\t(right block{} block{})\n'.format(index, block['surroundingBlocks']['right'])
		if('down' in block['surroundingBlocks']):
			init += '\t(down block{} block{})\n'.format(index, block['surroundingBlocks']['down'])

	init += '\n'

	for color, blocks in parsedTarget['colors'].items():
		for i in range(len(blocks)):
			#init += '\t(is-{} block{})\n'.format(color, blocks[i])
			goal += '\t(is-empty block{})\n'.format(blocks[i])

			for k in range(len(blocks)):
				if(i != k):
					init += '\t(same-color block{} block{})\n'.format(blocks[i], blocks[k])

	objects = objects[:-1]
	init = init[:-1]
	goal = goal[:-1]
	
	output = """(define (problem puzznic-{})
(:domain puzznic)
(:objects {})
(:init
{}
	(= (num-steps) 0)
)
(:goal (and
{}
)
)
(:metric minimize (num-steps))
)""".format(inputName, objects, init, goal)

	return output

def saveOutput(output, path):
	file = open(path, 'w')
	file.write(output)
	file.close()

targetFile = None
target = None

configFile = None
config = None

try:
	targetFile = open('{}/{}/{}.json'.format(os.path.dirname(__file__), sys.argv[1], sys.argv[1]), 'r')
except:
	raise Exception('Error opening target file.')

try:
	target = json.load(targetFile)
	targetFile.close()
except:
	raise Exception('Error parsing target file.')

try:
	configFile = open('{}/config.json'.format(os.path.dirname(__file__)), 'r')
except:
	raise Exception('Error opening config file.')

try:
	config = json.load(configFile)
	configFile.close()
except:
	raise Exception('Error parsing config file.')

parsedTarget = parseTarget(config, target)
output = generateOutput(parsedTarget, sys.argv[1])

try:
	saveOutput(output, '{}/{}/problem-{}.pddl'.format(os.path.dirname(__file__), sys.argv[1], sys.argv[1]))
except:
	raise Exception('Error during problem file saving.')
