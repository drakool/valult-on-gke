

private_targets_apps() {
    # Any sample application install and configuration for the E2E walkthrough.

    echo "Configuring walkthrough applications"

    for template in $(ls *.template); do
    envsubst '${PROJECT_ID}' < ${template} > ${template%.*}
    done

    cp skaffold.yaml ${PROJECT_DIR}/web-private-targets

    #git tag -a v1 -m "version 1 release"
}


private_targets_apps

