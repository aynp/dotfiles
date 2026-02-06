function glogin
    echo "Logging in to gcloud..."
    gcloud auth login &>/dev/null
    and echo "Logging in to application-default..."
    and gcloud auth application-default login &>/dev/null
end
