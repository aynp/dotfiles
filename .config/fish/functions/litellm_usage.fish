function litellm_usage
    set -l api_key $LITELLM_API_KEY
    curl -s -H "Authorization: Bearer $api_key" 'https://litellm.mercari.in/user/info' | jq -r '.user_info | 
        "LiteLLM Usage Report\n" +
        "===================\n" +
        "Spend:      $" + (.spend | tostring) + "\n" +
        "Budget:     $" + (.max_budget | tostring) + "\n" +
        "Usage:      " + ((.spend / .max_budget * 100) | round | tostring) + "%"'
end
