# Defined in - @ line 1
function ailimits --wraps='curl -X GET -H "Authorization: Bearer $OPENAI_API_KEY" "OPENAI_HOST" | jq .' --description 'Get current limits for using ai models'
  if not set -q OPENAI_API_KEY
    echo "OPENAI_API_KEY is not set" >&2
    return 1
  end
  if not set -q OPENAI_HOST
    echo "OPENAI_HOST is not set" >&2
    return 1
  end
  curl -X GET -H "Authorization: Bearer $OPENAI_API_KEY" "$OPENAI_HOST" | jq .
end
