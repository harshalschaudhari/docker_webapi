using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;

namespace docker_webapi.Controllers {
    [Route("api/[controller]")]
    [ApiController]
    public class ValuesController : ControllerBase {
        // GET api/values
        [HttpGet]
        public ActionResult<IEnumerable<string>> Get() {
            return new string[] { "webapi working!", "webapi working!" };
        }

        // GET api/values/5
        [HttpGet("{name}")]
        public ActionResult<string> Get(string name) {
            return "Hello " + name;
        }

        // POST api/values
        [HttpPost]
        public ActionResult<string> Post([FromBody] string value) {
            return "Hello" + value;
        }

        // PUT api/values/5
        [HttpPut("{id}")]
        public void Put(int id, [FromBody] string value) {
        }

        // DELETE api/values/5
        [HttpDelete("{id}")]
        public void Delete(int id) {
        }
    }
}
