class Project {
  String? errorMessage;
  List<ProjectModel>? projects;

  Project({
    this.errorMessage,
    this.projects,
  });

  Project.fromJson(Map<String, dynamic> json) {
    errorMessage = json['ErrMsg'];
    if (json['projects'] != null) {
      projects = <ProjectModel>[];
      json['projects'].forEach((project) {
        projects!.add(new ProjectModel.fromJson(project));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ErrMsg'] = this.errorMessage;
    if (this.projects != null) {
      data['projects'] =
          this.projects!.map((project) => project.toJson()).toList();
    }
    return data;
  }
}

class ProjectModel {
  int? iD;
  String? jobName;
  String? lineDesc;
  String? projLongDetails;
  String? auctionDate;
  int? jobState;
  String? coverLink;
  String? brochureLink;

  ProjectModel({
    this.iD,
    this.jobName,
    this.lineDesc,
    this.projLongDetails,
    this.auctionDate,
    this.jobState,
    this.coverLink,
    this.brochureLink,
  });

  ProjectModel.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    jobName = json['JobName'];
    lineDesc = json['LineDesc'];
    projLongDetails = json['ProjLongDetails'];
    auctionDate = json['AuctionDate'];
    jobState = json['JobState'];
    coverLink = json['CoverLink'];
    brochureLink = json['BrochureLink'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID'] = this.iD;
    data['JobName'] = this.jobName;
    data['LineDesc'] = this.lineDesc;
    data['ProjLongDetails'] = this.projLongDetails;
    data['AuctionDate'] = this.auctionDate;
    data['JobState'] = this.jobState;
    data['CoverLink'] = this.coverLink;
    data['BrochureLink'] = this.brochureLink;
    return data;
  }
}
