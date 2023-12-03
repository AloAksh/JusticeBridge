from flask import Flask, request, jsonify
from flask_cors import CORS
from langchain.embeddings.openai import OpenAIEmbeddings
from langchain.vectorstores.faiss import FAISS
from langchain.text_splitter import RecursiveCharacterTextSplitter
from langchain import OpenAI, VectorDBQA

#@title Environment Vars
import os
os.environ["OPENAI_API_KEY"] = "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"

app = Flask(__name__)
CORS(app)

information = """https://www.humanrightsinitiative.org/download/1457162682Undertrial%20Prisoners%20and%20the%20Criminal%20Justice%20System.pdf, https://nliulawreview.nliu.ac.in/wp-content/uploads/2022/01/Volume-VI-Issue-II-133-162.pdf, https://nyaaya.org/nyaaya-weekly/what-are-the-rights-of-undertrial-prisoners/, https://www.legalserviceindia.com/legal/article-7334-rights-of-under-trial-prisoners-in-india.html"""

text_splitter = RecursiveCharacterTextSplitter(chunk_size=1000, chunk_overlap=0)
texts = text_splitter.split_text(information)

embeddings = OpenAIEmbeddings()
vectorstore = FAISS.from_texts(texts, embeddings)
qa = VectorDBQA.from_chain_type(llm=OpenAI(), chain_type="stuff", vectorstore=vectorstore)

answer = ""
@app.route("/", methods = ['POST'])
def handle_request():
    try:
        query = request.get_json.get('text')
        if query:
            answer = qa.run(query)
            return jsonify({"response": answer})
        return jsonify({"error": "no question"})
    except Exception as e:
        return jsonify({"error": str(e)}, 500)

if __name__ == "__main__":
    app.run()
