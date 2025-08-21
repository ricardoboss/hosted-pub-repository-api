namespace PubService;

model ErrorResponse {
  error: {
    code: string;
    message: string;
  };
}

model UploadInitiation {
  url: string;
  fields: Record<string>;
}

model PackageInfo {
  name: string;
  isDiscontinued?: boolean;
  replacedBy?: string;
  advisoriesUpdated?: utcDateTime;
  latest?: VersionEntry;
  versions: VersionEntry[];
}

model VersionEntry {
  version: string;
  retracted?: boolean;
  archive_url: string;
  archive_sha256?: string;
  pubspec: Pubspec;
  published?: utcDateTime;
}

model Pubspec {
  name: string;
  description?: string;
  version?: string;
  homepage?: string;
  repository?: string;
  issue_tracker?: string;
  topics?: string[];
  environment?: Record<string>;
  dependencies?: Record<Dependency>;
  dev_dependencies?: Record<Dependency>;
  screenshots?: Screenshot[];
}

union Dependency {
  string,
  PathDependency,
  GitDependency,
  SdkDependency
}

model PathDependency { path: string; }
model GitDependency { repo: string; ref?: string; }
model SdkDependency { sdk: string; }

model Screenshot {
  description?: string;
  path: string;
}

model AdvisoriesResponse {
  advisories: OSV[];
}

model VersionInspect {
  version: string;
  pubspec: Pubspec;
}

model OSV {
  id: string;
  summary?: string;
  details?: string;
}
