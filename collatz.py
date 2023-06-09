import random
import time
from lib import database

try:
	query = "CREATE TABLE collatz_flotz (_id id, prev_set idset, next_set id);"
	result = database.featurebase_query({"sql": query})
except Exception as ex:
	print(ex)

values = ""
for x in range(1,30000):
	# print("running %s" % x)

	# the proof is we foolishly believe this will exit
	while True:
		# set what we are, currently
		prev_set = x

		# check if we are odd or even
		is_odd = x % 2

		# run the algo and update our number
		if is_odd:
			x = (x * 3) + 1
		else:
			x = int(x / 2)

		# query for if we have the newly calculated number already
		query = "SELECT next_set FROM collatz_flotz WHERE _id = %s" % x
		result = database.featurebase_query({"sql": query})

		# we already have the next number, so we add x to the prev_set set and exit loop
		if result.get('data', None):
			_next_set = result.get('data')[0][0]

			if values != "":
				values = values + ","

			values = values + "(%s, [%s], %s)" % (x, prev_set, _next_set)
			query = "INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES %s;" % values
			result = database.featurebase_query({"sql": query})
			values = ""
			break
		else:
			# we don't have the next number, so we set it
			is_odd = x % 2

			if is_odd:
				next_set = (x * 3) + 1
			else:
				next_set = int(x / 2)

			if values != "":
				values = values + ","

			values = values + "(%s, [%s], %s)" % (x, prev_set, next_set)
		if x == 1:
			query = "INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES %s;" % values
			result = database.featurebase_query({"sql": query})
			values = ""
			break