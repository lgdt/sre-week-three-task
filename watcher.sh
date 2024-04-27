NS=sre
DEPLOY=swype-app
MAX_RESTARTS=3

while true
do
    num_restarts=$(kubectl get pods -n $NS | grep $DEPLOY | awk '{print $4}')
    echo "Number of restarts of $DEPLOY app: $num_restarts"
    if [ "$num_restarts" -gt "$MAX_RESTARTS" ]; then
        kubectl scale deployment $DEPLOY -n $NS --replicas=0
    fi
    sleep 60
done