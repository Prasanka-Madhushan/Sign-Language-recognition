import uvicorn
from fastapi import Request, FastAPI, Depends
# from main import sentence

app = FastAPI()

@app.get("/")
def read_root():
    with open('output.txt', 'r') as f:
        sentence = f.readlines()
    print(sentence)
    return {"Sentence": sentence}


# uvicorn server --reload --host 0.0.0.0 --port 5000