"use strict";

const READER = new XMLHttpRequest() || new ActiveXObject("MSXML2.XMLHTTP");
let QUERY = null;
let CODE_ARR = null;

file_read("perl_query.pl");

async function file_read(file) {
  READER.open("get", file, true); 
  READER.onreadystatechange = () => {
    if (READER.readyState == 4) {
      QUERY = READER.responseText; 
    }
  };
  READER.send(null);
}

async function code_arr_text(code_arr) {
  // Parses code_arr into displayable html

  let ind = 0;
  return code_arr.map(x => {
    const [i, code, description, example_arr] = x;
    let entry_html = `
<table id = "filter-${i}" class = "filter-aaa" border="5">
<tr>
  <td class="code code-x" id = "code-${ind}"><xmp>${code}</xmp></td>
  <td class="description">${description}</td>
  <td class="${typeof example_arr === 'undefined' ? "example-hide" : "example"}">
    <button onclick="[...document.getElementsByClassName('${i}')].map(d=>d.classList.toggle('show'));">Examples</button>
  </td>
</tr>
</table>
`;
    ind += 1;
    let example_dropdown = ""

    if (typeof example_arr !== "undefined") {
      example_dropdown = example_arr.map(ex => {
        let [stdin, ex_code, stdout] = ["None", "", ""];
        console.log(ex);
        
        const sz = ex.length
        if (sz == 3) {
          [stdin, ex_code, stdout] = ex;
        } else if (sz == 2) {
          [ex_code, stdout] = ex;
        } else if (sz == 1) {
          ex_code = ex;
        } else {
          throw new Error("Unimplemented (Example of unknown size)")
        }

        const example_html = `
<tr class="tr-example">
  <tr>
    <td class="snippet code-x" id="code-${ind}"><xmp>${ex_code}</xmp></td>
    <td>
      <table>
        <tr>
          <td class="snippet-input">I: ${stdin}</td>
        </tr>
        <tr>
          <td class="snippet-output">O: ${stdout}</td>
        </tr>
      </table>
    </td>
  </tr>
</tr>`

        console.log(example_html)

        ind += 1; 
        return example_html;
      }).join("\n");
    }

    entry_html += `<table id = "filter-${i}" class="table-example dropdown ${i}">${example_dropdown}</table>`;

    return entry_html;

  }).join("\n")
}

async function code_mirror_rep() {
   [...document.getElementsByClassName("code-x")]
     .sort((a, b) => a.id.split("-")[1] - b.id.split("-")[1])
     .map(elem => { CodeMirror.runMode(elem.innerText, "text/x-perl", elem) });
}

async function file_parse() {
  // Parses QUERY into CODE_ARR

  const QUERY_ARR = QUERY.split("\n***\n");
// console.log(QUERY_ARR);
  CODE_ARR = QUERY_ARR.map((query, ind) => {
    // console.log(query);
    const [code, desc_pre] = query.split("\n---\n");
    const [desc, ...example_str_arr] = desc_pre.split("\niii\n");
    let example_arr = example_str_arr.map(example_str => {
      const [stdin, code, stdout] = example_str.split(/\n?(?:ccc|ooo)\n/g); 
      let arr = [];
      
      if (stdin !== "") {
        arr.push(stdin);
      }

      arr.push(code);
      
      if (typeof stdout !== "undefined") {
        arr.push(stdout);
      }

      return arr;
    });
    
    let ret = [ind, code, desc];
    if (example_arr.length > 0) ret.push(example_arr);

    return ret;
  });

  // console.log("code arr ", CODE_ARR);
  main(CODE_ARR);
}

async function main(code_arr) {
  let a = await code_arr_text(code_arr);
  // console.log(a);
  await $("#TABLE").html(a);
  await code_mirror_rep();
}

function toggle_search() {
  console.log($(".toggle-search-button").text());
  if ($(".toggle-search-button").text() === "Entry") {
    $(".toggle-search-button").text("Example");
  } else {
    $(".toggle-search-button").text("Entry");
  }
}

async function file_wait() {
  let FILE_READ_LOOP = setInterval(function() {
    if (QUERY === null) return;

    clearInterval(FILE_READ_LOOP);
    file_parse();
  }, 10);
}

$(document).ready(() => {
  file_wait();

  $("#QUERY").on("keyup", (e) => {
    console.log("huh");
    if (e.keyCode != 13) {
      return;
    }
    // console.log("HI");
    let query = $("#QUERY").val();
    // console.log("query", '[' + query + ']');
    // console.log("HI ", CODE_ARR);

    $(".dropdown").map((_i, drop) => {
      drop.classList.remove("show");
    });

    if ($(".toggle-search-button").text() === "Entry") {
      $(".table-example").map((_i, query_example_tab) => {
        if (query_example_tab.children.length > 0) {
          let query_example = query_example_tab.children[0].children;
          for (let i = 0; i < query_example.length; i++) {
              query_example[i].style.display = "table-row";
          }

        }
        query_example_tab.classList.remove("show");
        query_example_tab.style.display = "";
      });

      $(".filter-aaa").map((_i, query_entry) => {
        // console.log("entry ", query_entry.children[0].children[0].children[0].children[0]);
        // let re_raw = new RegExp(String.raw`${query}`);
        // let re = new RegExp(query);
        // let re_raw_arr = query.split(" ").map(q => new RegExp(String.raw`${q}`));
        // let re_arr = query.split(" ").map(q => new RegExp(q));
        let query_check = query_entry.children[0].children[0];
        let [code, description, _] = [...query_check.children].map(qe => qe.innerText);

        if (code.includes(query) || description.includes(query)) {
        // if (re.test(code) || re_raw.test(code) || re.test(description) || re.test(description) || re_raw_arr.some(r => r.test(code) || r.test(description)) || re_arr.some(r => r.test(code) || r.test(description))) {
          query_entry.style.display = "table";
        } else {
          query_entry.style.display = "none";
        }
      })

    } else {
      $(".filter-aaa").hide();

      $(".table-example").map((_i, query_example_tab) => {
        query_example_tab.style.display = "table";

        // console.log(_i, query_example_tab)
        if (query_example_tab.children.length > 0) {
          let query_example = query_example_tab.children[0].children;
          // console.log("what ", children);
          let query_match = 0;
          for(let i = 0; i < query_example.length; i++){
            if (query_example[i].innerText.includes(query)) {
              query_match += 1;
              query_example[i].style.display = "table-row";
            } else {
              query_example[i].style.display = "none";
            }
          }
          if (query_match) query_example_tab.style.display = "table";
        }
      });
    }
  });
});
