#file name
if [ $# -eq 0 ]; then
	echo "Error: please provide a problem #."
	echo "Usage: $0 <filename>"
	exit 1
fi

#filename
FILENAME="$1.f90"

#check if file exists
if [ -e "$FILENAME" ]; then
	echo "File '$FILENAME' already exists."
	echo "Do you want to overwrite it? (y/n)"
	read USER_INPUT

	if [ "$USER_INPUT" != y ]; then
		echo "Aborting operation."
		exit 0
	fi
fi

# Problem $
PROBLEM_NUMBER=$1
STRIPPED_PROBLEM=${PROBLEM_NUMBER#0}

# Get date
CURRENT_DATE=$(date +%F)

# Create file in current working directory
cat > "./$FILENAME" << EOF
! Problem $STRIPPED_PROBLEM
! Author: Christian Brewer
! Date: $CURRENT_DATE
! Prompt: 

program problem_$STRIPPED_PROBLEM
	implicit none


end program problem_$STRIPPED_PROBLEM
EOF

# Success
echo "File '$FILENAME' created in $(pwd)"
