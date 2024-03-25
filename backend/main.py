from flask import Flask, request
from flask_cors import CORS
from langchain_community.llms import OpenAI
from langchain_openai import OpenAIEmbeddings
from langchain.vectorstores.faiss import FAISS
from langchain.text_splitter import RecursiveCharacterTextSplitter
from langchain.chains.retrieval_qa.base import VectorDBQA
import os

os.environ["OPENAI_API_KEY"] = "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"

app = Flask(__name__)
CORS(app)

information = """
https://www.legalserviceindia.com/legal/article-7334-rights-of-under-trial-prisoners-in-india.html,
https://lddashboard.legislative.gov.in/sites/default/files/COI...pdf,
https://nhrc.nic.in/sites/default/files/11%20Rights%20of%20Prisoners-compressed.pdf,
https://www.livelaw.in/news-updates/issues-undertrials-standing-stubborn-against-face-democracy-rajasthan-hc-grants-bail-ndpsaccused-jail-6yrs-213854,
https://www.livelaw.in/high-court/bombay-high-court/bombay-high-court-undertrials-court-physically-cumbersome-vc-facility-presence-243535
"""

text_splitter = RecursiveCharacterTextSplitter(chunk_size=1000, chunk_overlap=0)
texts = text_splitter.split_text(information)

embeddings = OpenAIEmbeddings()
vectorstore = FAISS.from_texts(texts, embeddings)
qa = VectorDBQA.from_chain_type(llm=OpenAI(), chain_type="stuff", vectorstore=vectorstore)

@app.route("/", methods=['POST', 'OPTIONS'])
def main():
    try:
        response_headers = {
            'Access-Control-Allow-Origin': '*',
            'Access-Control-Allow-Methods': 'POST',
            'Access-Control-Allow-Headers': 'Content-Type',
        }
        data = request.get_json()  # Assuming JSON input
        query = data.get('text')  # Extracting 'text' from JSON payload
        print("Question: ===", query)
        answer = qa.run(query)
        response_headers['Access-Control-Allow-Origin'] = "*"
        return {"response": answer}, 200, response_headers  # Returning response with headers
    except Exception as e:
        print("ERROR:  == ", str(e))
        return {"error": str(e)}, 500

if __name__ == "__main__":
    app.run(debug=True)
