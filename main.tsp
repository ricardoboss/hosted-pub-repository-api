import "@typespec/http";
import "@typespec/openapi";
import "./schemas.tsp";
import "./interfaces.tsp";

using TypeSpec.OpenAPI;
using TypeSpec.Http;

@service(#{
    title: "Hosted Pub Repository API",
//     version: "2.0.0",
})
@doc("""
REST API a hosted pub package repository must implement (Specification v2).

This specification models:
- List versions of a package
- Publishing flow
- Package security advisories
- Deprecated endpoints for compatibility
""")
@server("https://pub.dev", "Default public hosted pub repository")
@server("https://some-server.com/prefix/pub", "Example custom hosted-url")
@server("https://pub.other-server.com/prefix", "Example custom hosted-url")
@server("http://localhost:8080", "Local development server")
namespace PubService;
