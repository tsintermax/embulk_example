FOLDER := ./try3_csv_filter

.PHONY guess:
guess:
	embulk guess $(FOLDER)/seed.yml -o $(FOLDER)/config.yml 

.PHONY run:
run:
	embulk run $(FOLDER)/config.yml 