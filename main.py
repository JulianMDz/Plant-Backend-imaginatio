from fastapi import FastAPI

app =  FastAPI(title="Plant Backend API", description="API for Plamt Backend", version="1.0.0")

@app.get("/")
def root():
    return{"satatus": "ok", "message":"Plant API running " }

