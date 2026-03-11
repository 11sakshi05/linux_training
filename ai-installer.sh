#!/bin/bash

API_KEY=$GEMINI_API_KEY
MODEL="gemini-2.5-flash"

LOGFILE="ai_installer.log"

echo "===================================" 
echo " AI Linux Assistant (RHEL 10)"
echo "==================================="

echo "Type your request in normal language"
echo "Example: install docker and start service"

read -p "Your request: " USER_INPUT

echo "[$(date)] USER REQUEST: $USER_INPUT" >> $LOGFILE

PROMPT="You are a Linux administrator. Convert the following request into executable shell commands for Red Hat Enterprise Linux 10. Only output valid commands. Do not include explanations, markdown, or extra text. Request: $USER_INPUT"

echo ""
echo "Processing request using Gemini..."

RESPONSE=$(curl -s https://generativelanguage.googleapis.com/v1beta/models/$MODEL:generateContent?key=$API_KEY \
-H "Content-Type: application/json" \
-d "{
  \"contents\": [{
    \"parts\": [{
      \"text\": \"$PROMPT\"
    }]
  }]
}")

COMMANDS=$(echo $RESPONSE | jq -r '.candidates[0].content.parts[0].text')

echo ""
echo "Commands generated:"
echo "-----------------------------------"
echo "$COMMANDS"
echo "-----------------------------------"

echo "[$(date)] GENERATED COMMANDS:" >> $LOGFILE
echo "$COMMANDS" >> $LOGFILE

echo ""
read -p "Execute these commands? (yes/no): " CONFIRM

if [ "$CONFIRM" != "yes" ]; then
    echo "Execution cancelled."
    echo "[$(date)] EXECUTION CANCELLED" >> $LOGFILE
    exit
fi

echo ""
echo "Executing commands..."

echo "$COMMANDS" | while read CMD
do
    CMD=$(echo $CMD | sed 's/^ *//g')

    if [ -z "$CMD" ]; then
        continue
    fi

    echo ""
    echo "Running: $CMD"

    echo "[$(date)] RUNNING: $CMD" >> $LOGFILE

    OUTPUT=$(eval "$CMD" 2>&1)

    echo "$OUTPUT"

    echo "$OUTPUT" >> $LOGFILE

done

echo ""
echo "Task Completed."
echo "[$(date)] TASK COMPLETED" >> $LOGFILE
