namespace PubService;

using Http;

@route("/api/packages")
@tag("Packages")
interface Packages {
  /** List all versions of a package */
  @get list(
    @path package: string,
    @header("Accept") accept: "application/vnd.pub.v2+json",
    @header("User-Agent") userAgent?: string
  ): PackageInfo | ErrorResponse;
}

@route("/api/packages/versions")
@tag("Publishing")
interface Publishing {
  /** Initiate package publishing */
  @route("new")
  @get initiate(
    @header("Accept") accept: "application/vnd.pub.v2+json",
    @header("User-Agent") userAgent?: string
  ): UploadInitiation | ErrorResponse;
}

@route("/api/packages/{package}/advisories")
@tag("Advisories")
interface Advisories {
  /** List security advisories for a package */
  @get list(
    @path package: string,
    @header("Accept") accept: "application/vnd.pub.v2+json",
    @header("User-Agent") userAgent?: string
  ): AdvisoriesResponse | ErrorResponse;
}

@route("/api/packages/{package}/versions/{version}")
@tag("Compatibility (Deprecated)")
interface Compatibility {
  /** Inspect a specific version (Deprecated) */
  #deprecated "as of Dart 2.8, use “List all versions of a package” instead. Servers should still support this end-point for compatibility with older pub clients."
  @get inspect(
    @path package: string,
    @path version: string,
    @header("Accept") accept: "application/vnd.pub.v2+json",
    @header("User-Agent") userAgent?: string
  ): VersionInspect | ErrorResponse;
}

@route("/packages/{package}/versions/{version}.tar.gz")
@tag("Compatibility (Deprecated)")
interface Archive {
  /** Download a specific version archive (Deprecated) */
  #deprecated "as of Dart 2.8, use the archive_url returned from the “List all versions of a package”. Servers should still support this end-point for compatibility with older pub clients."
  @get download(
    @path package: string,
    @path version: string,
    @header("User-Agent") userAgent?: string,
    @header("Accept") accept?: "application/octet-stream"
  ): bytes | ErrorResponse;
}
