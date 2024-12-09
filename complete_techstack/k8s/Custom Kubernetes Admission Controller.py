#Scenario: Enforce policies to ensure pods always have resource limits using a Kubernetes validating admission webhook.

#Solution: Create a Python webhook using Flask:

from flask import Flask, request, jsonify

app = Flask(__name__)

@app.route('/validate', methods=['POST'])
def validate():
    request_data = request.get_json()
    pod = request_data['request']['object']
    if not pod['spec']['containers'][0].get('resources', {}).get('limits'):
        return jsonify({
            "response": {
                "allowed": False,
                "status": {"message": "Resource limits are required!"}
            }
        })
    return jsonify({"response": {"allowed": True}})

app.run(host='0.0.0.0', port=443, ssl_context=('cert.pem', 'key.pem'))
#Deploy this webhook with a Kubernetes ValidatingWebhookConfiguration.
