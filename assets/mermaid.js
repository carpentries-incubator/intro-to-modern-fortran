window.addEventListener("DOMContentLoaded",()=>{document.querySelectorAll("pre.mermaid").forEach($el=>{console.log($el),($el="CODE"===$el.tagName?$el.parentElement:$el).outerHTML=`
        <div class="mermaid">${$el.textContent}</div>
        <details>
          <summary>Diagram source</summary>
          <pre>${$el.textContent}</pre>
        </details>
      `})}),mermaid.initialize({logLevel:"error",securityLevel:"loose",theme:window.matchMedia&&window.matchMedia("(prefers-color-scheme: dark)").matches?"dark":"default"});