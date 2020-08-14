# Defined in /home/sab/.config/fish/functions/kgreq.fish @ line 1
function kgreq --description 'Print POD requirements and limits in current namespace'
    kubectl get pods  -o=custom-columns='NAME:spec.containers[*].name,MEMREQ:spec.containers[*].resources.requests.memory,MEMLIM:spec.containers[*].resources.limits.memory,CPUREQ:spec.containers[*].resources.requests.cpu,CPULIM:spec.containers[*].resources.limits.cpu'
end
