#DevOps Labs

Hands-on labs to practice core DevOps skills with minimal cost.

## Structure
- `scripts/` - Bash utilities to see: processes, networking, resources, how to basics
- `notes/` - Personal Notes / Cheat Sheets, files created/modified using how to's
- `.github/workflows/` - CI/CD pipelines (Coming Soon as of 8/26/2025)

## Quick Start
```bash

# Processes
./scripts/processes.sh

# Resources
./scripts/resources.sh

# How-to Basics
./scripts/hello.sh

# Package installs
./scripts/packages.sh


---------------------------

# Phase 2 - CI/CD

We'll start tiny: a ***Python Flas*** "Hello API" with unit tests.  Next, we will wire Github Actions with Docker.

## 1) Create the app

```bash
# from repo root
mkdir -p app tests

# app code
cat > app/app.py << 'EOF'
from flask import Flask, jsonify

app = Flask(__name__)

@app.get("/healthz)
def health():
return jsonify(status="ok")

@app.get("/hello")
def hello():
return jsonify(message="Hello from devops-labs!")

if __name__ == "__main__":
# bind to 0.0.0.0 so Docker can expose it later
app.run(host="0.0.0.0", port=8000)

# requirements
cat > requirements.txt << 'EOF'
flask==3.0.3
pytest==8.3.2
EOF

# simple tests
cat > tests/test_app.py << 'EOF'
import json
from app.app import app

def test_healthz():
    client = app.test_client()
    r = client.get("/healthz")
    assert r.status_code == 200
    assert r.get_json().get("status") == "ok"

def test_hello():
    client = app.test_client()
    r = client.get("/hello")
    assert r.status_code == 200
    assert "Hello" in r.get_json().get("message", "")
EOF
