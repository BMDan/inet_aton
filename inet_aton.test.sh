#!/bin/bash

# Runs tests on inet_aton.sh

source inet_aton.sh

# Error cases
inet_aton a0.0.0.0		# -1
inet_aton 0.0.0.0a		# -1
inet_aton 0.0.0a.0		# -1
inet_aton 256.256.256.256	# -1
inet_aton 2.-1.0.0		# -1

# Edges
inet_aton 0.0.0.0		# 0
inet_aton 0			# 0
inet_aton 255.255.255.255	# 4294967295
inet_aton 4294967295		# 4294967295

# Odd-shaped addresses (perfectly valid, though)
inet_aton 127.1	# 127.0.0.1=====2130706433
inet_aton 10.198417 # 10.3.7.17=167970577

# Octal and hex (currently not supported, will fail)
inet_aton 1.2.3.037 # 1.2.3.31==16909087
inet_aton 1.0xa.3.4 # 1.10.3.4==17433348

# Random values
inet_aton 96.17.209.133		# 1611780485
inet_aton 62.12.196.98		# 1041024098
inet_aton 101.237.86.198	# 1710053062
inet_aton 252.237.86.198	# 4243412678
