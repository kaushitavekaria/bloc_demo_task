class SearchModel {
    int? totalCount;
    bool? incompleteResults;
    List<Item>? items;
    String? error;

    SearchModel({
        required this.totalCount,
        required this.incompleteResults,
        required this.items,
    });

    SearchModel copyWith({
        int? totalCount,
        bool? incompleteResults,
        List<Item>? items,
    }) => 
        SearchModel(
            totalCount: totalCount ?? this.totalCount,
            incompleteResults: incompleteResults ?? this.incompleteResults,
            items: items ?? this.items,
        );

    factory SearchModel.fromJson(Map<String, dynamic> json) => SearchModel(
        totalCount: json["total_count"],
        incompleteResults: json["incomplete_results"],
        items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
    );

    SearchModel.withError(String errorMessage) {
      error = errorMessage;
    }

    Map<String, dynamic> toJson() => {
        "total_count": totalCount,
        "incomplete_results": incompleteResults,
        "items": (items != null && (items ?? []).isNotEmpty) ? List<dynamic>.from(items!.map((x) => x.toJson())) : [],
    };
}

class Item {
    int id;
    String nodeId;
    String name;
    String fullName;
    bool private;
    Owner owner;
    String htmlUrl;
    String? description;
    bool fork;
    String url;
    String forksUrl;
    String keysUrl;
    String collaboratorsUrl;
    String teamsUrl;
    String hooksUrl;
    String issueEventsUrl;
    String eventsUrl;
    String assigneesUrl;
    String branchesUrl;
    String tagsUrl;
    String blobsUrl;
    String gitTagsUrl;
    String gitRefsUrl;
    String treesUrl;
    String statusesUrl;
    String languagesUrl;
    String stargazersUrl;
    String contributorsUrl;
    String subscribersUrl;
    String subscriptionUrl;
    String commitsUrl;
    String gitCommitsUrl;
    String commentsUrl;
    String issueCommentUrl;
    String contentsUrl;
    String compareUrl;
    String mergesUrl;
    String archiveUrl;
    String downloadsUrl;
    String issuesUrl;
    String pullsUrl;
    String milestonesUrl;
    String notificationsUrl;
    String labelsUrl;
    String releasesUrl;
    String deploymentsUrl;
    DateTime createdAt;
    DateTime updatedAt;
    DateTime pushedAt;
    String gitUrl;
    String sshUrl;
    String cloneUrl;
    String svnUrl;
    String? homepage;
    int size;
    int stargazersCount;
    int watchersCount;
    String? language;
    bool hasIssues;
    bool hasProjects;
    bool hasDownloads;
    bool hasWiki;
    bool hasPages;
    bool hasDiscussions;
    int forksCount;
    dynamic mirrorUrl;
    bool archived;
    bool disabled;
    int openIssuesCount;
    License? license;
    bool allowForking;
    bool isTemplate;
    bool webCommitSignoffRequired;
    List<String> topics;
    Visibility visibility;
    int forks;
    int openIssues;
    int watchers;
    DefaultBranch defaultBranch;
    double score;

    Item({
        required this.id,
        required this.nodeId,
        required this.name,
        required this.fullName,
        required this.private,
        required this.owner,
        required this.htmlUrl,
        required this.description,
        required this.fork,
        required this.url,
        required this.forksUrl,
        required this.keysUrl,
        required this.collaboratorsUrl,
        required this.teamsUrl,
        required this.hooksUrl,
        required this.issueEventsUrl,
        required this.eventsUrl,
        required this.assigneesUrl,
        required this.branchesUrl,
        required this.tagsUrl,
        required this.blobsUrl,
        required this.gitTagsUrl,
        required this.gitRefsUrl,
        required this.treesUrl,
        required this.statusesUrl,
        required this.languagesUrl,
        required this.stargazersUrl,
        required this.contributorsUrl,
        required this.subscribersUrl,
        required this.subscriptionUrl,
        required this.commitsUrl,
        required this.gitCommitsUrl,
        required this.commentsUrl,
        required this.issueCommentUrl,
        required this.contentsUrl,
        required this.compareUrl,
        required this.mergesUrl,
        required this.archiveUrl,
        required this.downloadsUrl,
        required this.issuesUrl,
        required this.pullsUrl,
        required this.milestonesUrl,
        required this.notificationsUrl,
        required this.labelsUrl,
        required this.releasesUrl,
        required this.deploymentsUrl,
        required this.createdAt,
        required this.updatedAt,
        required this.pushedAt,
        required this.gitUrl,
        required this.sshUrl,
        required this.cloneUrl,
        required this.svnUrl,
        required this.homepage,
        required this.size,
        required this.stargazersCount,
        required this.watchersCount,
        required this.language,
        required this.hasIssues,
        required this.hasProjects,
        required this.hasDownloads,
        required this.hasWiki,
        required this.hasPages,
        required this.hasDiscussions,
        required this.forksCount,
        required this.mirrorUrl,
        required this.archived,
        required this.disabled,
        required this.openIssuesCount,
        required this.license,
        required this.allowForking,
        required this.isTemplate,
        required this.webCommitSignoffRequired,
        required this.topics,
        required this.visibility,
        required this.forks,
        required this.openIssues,
        required this.watchers,
        required this.defaultBranch,
        required this.score,
    });

    Item copyWith({
        int? id,
        String? nodeId,
        String? name,
        String? fullName,
        bool? private,
        Owner? owner,
        String? htmlUrl,
        String? description,
        bool? fork,
        String? url,
        String? forksUrl,
        String? keysUrl,
        String? collaboratorsUrl,
        String? teamsUrl,
        String? hooksUrl,
        String? issueEventsUrl,
        String? eventsUrl,
        String? assigneesUrl,
        String? branchesUrl,
        String? tagsUrl,
        String? blobsUrl,
        String? gitTagsUrl,
        String? gitRefsUrl,
        String? treesUrl,
        String? statusesUrl,
        String? languagesUrl,
        String? stargazersUrl,
        String? contributorsUrl,
        String? subscribersUrl,
        String? subscriptionUrl,
        String? commitsUrl,
        String? gitCommitsUrl,
        String? commentsUrl,
        String? issueCommentUrl,
        String? contentsUrl,
        String? compareUrl,
        String? mergesUrl,
        String? archiveUrl,
        String? downloadsUrl,
        String? issuesUrl,
        String? pullsUrl,
        String? milestonesUrl,
        String? notificationsUrl,
        String? labelsUrl,
        String? releasesUrl,
        String? deploymentsUrl,
        DateTime? createdAt,
        DateTime? updatedAt,
        DateTime? pushedAt,
        String? gitUrl,
        String? sshUrl,
        String? cloneUrl,
        String? svnUrl,
        String? homepage,
        int? size,
        int? stargazersCount,
        int? watchersCount,
        String? language,
        bool? hasIssues,
        bool? hasProjects,
        bool? hasDownloads,
        bool? hasWiki,
        bool? hasPages,
        bool? hasDiscussions,
        int? forksCount,
        dynamic mirrorUrl,
        bool? archived,
        bool? disabled,
        int? openIssuesCount,
        License? license,
        bool? allowForking,
        bool? isTemplate,
        bool? webCommitSignoffRequired,
        List<String>? topics,
        Visibility? visibility,
        int? forks,
        int? openIssues,
        int? watchers,
        DefaultBranch? defaultBranch,
        double? score,
    }) => 
        Item(
            id: id ?? this.id,
            nodeId: nodeId ?? this.nodeId,
            name: name ?? this.name,
            fullName: fullName ?? this.fullName,
            private: private ?? this.private,
            owner: owner ?? this.owner,
            htmlUrl: htmlUrl ?? this.htmlUrl,
            description: description ?? this.description,
            fork: fork ?? this.fork,
            url: url ?? this.url,
            forksUrl: forksUrl ?? this.forksUrl,
            keysUrl: keysUrl ?? this.keysUrl,
            collaboratorsUrl: collaboratorsUrl ?? this.collaboratorsUrl,
            teamsUrl: teamsUrl ?? this.teamsUrl,
            hooksUrl: hooksUrl ?? this.hooksUrl,
            issueEventsUrl: issueEventsUrl ?? this.issueEventsUrl,
            eventsUrl: eventsUrl ?? this.eventsUrl,
            assigneesUrl: assigneesUrl ?? this.assigneesUrl,
            branchesUrl: branchesUrl ?? this.branchesUrl,
            tagsUrl: tagsUrl ?? this.tagsUrl,
            blobsUrl: blobsUrl ?? this.blobsUrl,
            gitTagsUrl: gitTagsUrl ?? this.gitTagsUrl,
            gitRefsUrl: gitRefsUrl ?? this.gitRefsUrl,
            treesUrl: treesUrl ?? this.treesUrl,
            statusesUrl: statusesUrl ?? this.statusesUrl,
            languagesUrl: languagesUrl ?? this.languagesUrl,
            stargazersUrl: stargazersUrl ?? this.stargazersUrl,
            contributorsUrl: contributorsUrl ?? this.contributorsUrl,
            subscribersUrl: subscribersUrl ?? this.subscribersUrl,
            subscriptionUrl: subscriptionUrl ?? this.subscriptionUrl,
            commitsUrl: commitsUrl ?? this.commitsUrl,
            gitCommitsUrl: gitCommitsUrl ?? this.gitCommitsUrl,
            commentsUrl: commentsUrl ?? this.commentsUrl,
            issueCommentUrl: issueCommentUrl ?? this.issueCommentUrl,
            contentsUrl: contentsUrl ?? this.contentsUrl,
            compareUrl: compareUrl ?? this.compareUrl,
            mergesUrl: mergesUrl ?? this.mergesUrl,
            archiveUrl: archiveUrl ?? this.archiveUrl,
            downloadsUrl: downloadsUrl ?? this.downloadsUrl,
            issuesUrl: issuesUrl ?? this.issuesUrl,
            pullsUrl: pullsUrl ?? this.pullsUrl,
            milestonesUrl: milestonesUrl ?? this.milestonesUrl,
            notificationsUrl: notificationsUrl ?? this.notificationsUrl,
            labelsUrl: labelsUrl ?? this.labelsUrl,
            releasesUrl: releasesUrl ?? this.releasesUrl,
            deploymentsUrl: deploymentsUrl ?? this.deploymentsUrl,
            createdAt: createdAt ?? this.createdAt,
            updatedAt: updatedAt ?? this.updatedAt,
            pushedAt: pushedAt ?? this.pushedAt,
            gitUrl: gitUrl ?? this.gitUrl,
            sshUrl: sshUrl ?? this.sshUrl,
            cloneUrl: cloneUrl ?? this.cloneUrl,
            svnUrl: svnUrl ?? this.svnUrl,
            homepage: homepage ?? this.homepage,
            size: size ?? this.size,
            stargazersCount: stargazersCount ?? this.stargazersCount,
            watchersCount: watchersCount ?? this.watchersCount,
            language: language ?? this.language,
            hasIssues: hasIssues ?? this.hasIssues,
            hasProjects: hasProjects ?? this.hasProjects,
            hasDownloads: hasDownloads ?? this.hasDownloads,
            hasWiki: hasWiki ?? this.hasWiki,
            hasPages: hasPages ?? this.hasPages,
            hasDiscussions: hasDiscussions ?? this.hasDiscussions,
            forksCount: forksCount ?? this.forksCount,
            mirrorUrl: mirrorUrl ?? this.mirrorUrl,
            archived: archived ?? this.archived,
            disabled: disabled ?? this.disabled,
            openIssuesCount: openIssuesCount ?? this.openIssuesCount,
            license: license ?? this.license,
            allowForking: allowForking ?? this.allowForking,
            isTemplate: isTemplate ?? this.isTemplate,
            webCommitSignoffRequired: webCommitSignoffRequired ?? this.webCommitSignoffRequired,
            topics: topics ?? this.topics,
            visibility: visibility ?? this.visibility,
            forks: forks ?? this.forks,
            openIssues: openIssues ?? this.openIssues,
            watchers: watchers ?? this.watchers,
            defaultBranch: defaultBranch ?? this.defaultBranch,
            score: score ?? this.score,
        );

    factory Item.fromJson(Map<String, dynamic> json) => Item(
        id: json["id"],
        nodeId: json["node_id"],
        name: json["name"],
        fullName: json["full_name"],
        private: json["private"],
        owner: Owner.fromJson(json["owner"]),
        htmlUrl: json["html_url"],
        description: json["description"],
        fork: json["fork"],
        url: json["url"],
        forksUrl: json["forks_url"],
        keysUrl: json["keys_url"],
        collaboratorsUrl: json["collaborators_url"],
        teamsUrl: json["teams_url"],
        hooksUrl: json["hooks_url"],
        issueEventsUrl: json["issue_events_url"],
        eventsUrl: json["events_url"],
        assigneesUrl: json["assignees_url"],
        branchesUrl: json["branches_url"],
        tagsUrl: json["tags_url"],
        blobsUrl: json["blobs_url"],
        gitTagsUrl: json["git_tags_url"],
        gitRefsUrl: json["git_refs_url"],
        treesUrl: json["trees_url"],
        statusesUrl: json["statuses_url"],
        languagesUrl: json["languages_url"],
        stargazersUrl: json["stargazers_url"],
        contributorsUrl: json["contributors_url"],
        subscribersUrl: json["subscribers_url"],
        subscriptionUrl: json["subscription_url"],
        commitsUrl: json["commits_url"],
        gitCommitsUrl: json["git_commits_url"],
        commentsUrl: json["comments_url"],
        issueCommentUrl: json["issue_comment_url"],
        contentsUrl: json["contents_url"],
        compareUrl: json["compare_url"],
        mergesUrl: json["merges_url"],
        archiveUrl: json["archive_url"],
        downloadsUrl: json["downloads_url"],
        issuesUrl: json["issues_url"],
        pullsUrl: json["pulls_url"],
        milestonesUrl: json["milestones_url"],
        notificationsUrl: json["notifications_url"],
        labelsUrl: json["labels_url"],
        releasesUrl: json["releases_url"],
        deploymentsUrl: json["deployments_url"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        pushedAt: DateTime.parse(json["pushed_at"]),
        gitUrl: json["git_url"],
        sshUrl: json["ssh_url"],
        cloneUrl: json["clone_url"],
        svnUrl: json["svn_url"],
        homepage: json["homepage"],
        size: json["size"],
        stargazersCount: json["stargazers_count"],
        watchersCount: json["watchers_count"],
        language: json["language"],
        hasIssues: json["has_issues"],
        hasProjects: json["has_projects"],
        hasDownloads: json["has_downloads"],
        hasWiki: json["has_wiki"],
        hasPages: json["has_pages"],
        hasDiscussions: json["has_discussions"],
        forksCount: json["forks_count"],
        mirrorUrl: json["mirror_url"],
        archived: json["archived"],
        disabled: json["disabled"],
        openIssuesCount: json["open_issues_count"],
        license: json["license"] == null ? null : License.fromJson(json["license"]),
        allowForking: json["allow_forking"],
        isTemplate: json["is_template"],
        webCommitSignoffRequired: json["web_commit_signoff_required"],
        topics: List<String>.from(json["topics"].map((x) => x)),
        visibility: visibilityValues.map[json["visibility"]] ?? Visibility.public,
        forks: json["forks"],
        openIssues: json["open_issues"],
        watchers: json["watchers"],
        defaultBranch: defaultBranchValues.map[json["default_branch"]] ?? DefaultBranch.main,
        score: json["score"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "node_id": nodeId,
        "name": name,
        "full_name": fullName,
        "private": private,
        "owner": owner.toJson(),
        "html_url": htmlUrl,
        "description": description,
        "fork": fork,
        "url": url,
        "forks_url": forksUrl,
        "keys_url": keysUrl,
        "collaborators_url": collaboratorsUrl,
        "teams_url": teamsUrl,
        "hooks_url": hooksUrl,
        "issue_events_url": issueEventsUrl,
        "events_url": eventsUrl,
        "assignees_url": assigneesUrl,
        "branches_url": branchesUrl,
        "tags_url": tagsUrl,
        "blobs_url": blobsUrl,
        "git_tags_url": gitTagsUrl,
        "git_refs_url": gitRefsUrl,
        "trees_url": treesUrl,
        "statuses_url": statusesUrl,
        "languages_url": languagesUrl,
        "stargazers_url": stargazersUrl,
        "contributors_url": contributorsUrl,
        "subscribers_url": subscribersUrl,
        "subscription_url": subscriptionUrl,
        "commits_url": commitsUrl,
        "git_commits_url": gitCommitsUrl,
        "comments_url": commentsUrl,
        "issue_comment_url": issueCommentUrl,
        "contents_url": contentsUrl,
        "compare_url": compareUrl,
        "merges_url": mergesUrl,
        "archive_url": archiveUrl,
        "downloads_url": downloadsUrl,
        "issues_url": issuesUrl,
        "pulls_url": pullsUrl,
        "milestones_url": milestonesUrl,
        "notifications_url": notificationsUrl,
        "labels_url": labelsUrl,
        "releases_url": releasesUrl,
        "deployments_url": deploymentsUrl,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "pushed_at": pushedAt.toIso8601String(),
        "git_url": gitUrl,
        "ssh_url": sshUrl,
        "clone_url": cloneUrl,
        "svn_url": svnUrl,
        "homepage": homepage,
        "size": size,
        "stargazers_count": stargazersCount,
        "watchers_count": watchersCount,
        "language": language,
        "has_issues": hasIssues,
        "has_projects": hasProjects,
        "has_downloads": hasDownloads,
        "has_wiki": hasWiki,
        "has_pages": hasPages,
        "has_discussions": hasDiscussions,
        "forks_count": forksCount,
        "mirror_url": mirrorUrl,
        "archived": archived,
        "disabled": disabled,
        "open_issues_count": openIssuesCount,
        "license": license?.toJson(),
        "allow_forking": allowForking,
        "is_template": isTemplate,
        "web_commit_signoff_required": webCommitSignoffRequired,
        "topics": List<dynamic>.from(topics.map((x) => x)),
        "visibility": visibilityValues.reverse[visibility],
        "forks": forks,
        "open_issues": openIssues,
        "watchers": watchers,
        "default_branch": defaultBranchValues.reverse[defaultBranch],
        "score": score,
    };
}

enum DefaultBranch {
    adinLlvm,
    main,
    master
}

final defaultBranchValues = EnumValues({
    "adin-llvm": DefaultBranch.adinLlvm,
    "main": DefaultBranch.main,
    "master": DefaultBranch.master
});

class License {
    Key key;
    Name name;
    SpdxId spdxId;
    String? url;
    NodeId nodeId;

    License({
        required this.key,
        required this.name,
        required this.spdxId,
        required this.url,
        required this.nodeId,
    });

    License copyWith({
        Key? key,
        Name? name,
        SpdxId? spdxId,
        String? url,
        NodeId? nodeId,
    }) => 
        License(
            key: key ?? this.key,
            name: name ?? this.name,
            spdxId: spdxId ?? this.spdxId,
            url: url ?? this.url,
            nodeId: nodeId ?? this.nodeId,
        );

    factory License.fromJson(Map<String, dynamic> json) => License(
        key: keyValues.map[json["key"]] ?? Key.cc0_10,
        name: nameValues.map[json["name"]] ?? Name.creativeCommonsZeroV10Universal,
        spdxId: spdxIdValues.map[json["spdx_id"]] ?? SpdxId.cc0_10,
        url: json["url"],
        nodeId: nodeIdValues.map[json["node_id"]] ?? NodeId.mDC6TGLJZW5ZZTA,
    );

    Map<String, dynamic> toJson() => {
        "key": keyValues.reverse[key],
        "name": nameValues.reverse[name],
        "spdx_id": spdxIdValues.reverse[spdxId],
        "url": url,
        "node_id": nodeIdValues.reverse[nodeId],
    };
}

enum Key {
    cc0_10,
    mit,
    other
}

final keyValues = EnumValues({
    "cc0-1.0": Key.cc0_10,
    "mit": Key.mit,
    "other": Key.other
});

enum Name {
    creativeCommonsZeroV10Universal,
    mitLicense,
    other
}

final nameValues = EnumValues({
    "Creative Commons Zero v1.0 Universal": Name.creativeCommonsZeroV10Universal,
    "MIT License": Name.mitLicense,
    "Other": Name.other
});

enum NodeId {
    mDC6TGLJZW5ZZTA,
    mDC6TGLJZW5ZZTY,
    mDC6TGLJZW5ZZTEZ,
}

final nodeIdValues = EnumValues({
    "MDc6TGljZW5zZTA=": NodeId.mDC6TGLJZW5ZZTA,
    "MDc6TGljZW5zZTY=": NodeId.mDC6TGLJZW5ZZTY,
    "MDc6TGljZW5zZTEz": NodeId.mDC6TGLJZW5ZZTEZ
});

enum SpdxId {
    cc0_10,
    mit,
    noAssertion
}

final spdxIdValues = EnumValues({
    "CC0-1.0": SpdxId.cc0_10,
    "MIT": SpdxId.mit,
    "NOASSERTION": SpdxId.noAssertion
});

class Owner {
    String login;
    int id;
    String nodeId;
    String avatarUrl;
    String gravatarId;
    String url;
    String htmlUrl;
    String followersUrl;
    String followingUrl;
    String gistsUrl;
    String starredUrl;
    String subscriptionsUrl;
    String organizationsUrl;
    String reposUrl;
    String eventsUrl;
    String receivedEventsUrl;
    Type type;
    bool siteAdmin;

    Owner({
        required this.login,
        required this.id,
        required this.nodeId,
        required this.avatarUrl,
        required this.gravatarId,
        required this.url,
        required this.htmlUrl,
        required this.followersUrl,
        required this.followingUrl,
        required this.gistsUrl,
        required this.starredUrl,
        required this.subscriptionsUrl,
        required this.organizationsUrl,
        required this.reposUrl,
        required this.eventsUrl,
        required this.receivedEventsUrl,
        required this.type,
        required this.siteAdmin,
    });

    Owner copyWith({
        String? login,
        int? id,
        String? nodeId,
        String? avatarUrl,
        String? gravatarId,
        String? url,
        String? htmlUrl,
        String? followersUrl,
        String? followingUrl,
        String? gistsUrl,
        String? starredUrl,
        String? subscriptionsUrl,
        String? organizationsUrl,
        String? reposUrl,
        String? eventsUrl,
        String? receivedEventsUrl,
        Type? type,
        bool? siteAdmin,
    }) => 
        Owner(
            login: login ?? this.login,
            id: id ?? this.id,
            nodeId: nodeId ?? this.nodeId,
            avatarUrl: avatarUrl ?? this.avatarUrl,
            gravatarId: gravatarId ?? this.gravatarId,
            url: url ?? this.url,
            htmlUrl: htmlUrl ?? this.htmlUrl,
            followersUrl: followersUrl ?? this.followersUrl,
            followingUrl: followingUrl ?? this.followingUrl,
            gistsUrl: gistsUrl ?? this.gistsUrl,
            starredUrl: starredUrl ?? this.starredUrl,
            subscriptionsUrl: subscriptionsUrl ?? this.subscriptionsUrl,
            organizationsUrl: organizationsUrl ?? this.organizationsUrl,
            reposUrl: reposUrl ?? this.reposUrl,
            eventsUrl: eventsUrl ?? this.eventsUrl,
            receivedEventsUrl: receivedEventsUrl ?? this.receivedEventsUrl,
            type: type ?? this.type,
            siteAdmin: siteAdmin ?? this.siteAdmin,
        );

    factory Owner.fromJson(Map<String, dynamic> json) => Owner(
        login: json["login"],
        id: json["id"],
        nodeId: json["node_id"],
        avatarUrl: json["avatar_url"],
        gravatarId: json["gravatar_id"],
        url: json["url"],
        htmlUrl: json["html_url"],
        followersUrl: json["followers_url"],
        followingUrl: json["following_url"],
        gistsUrl: json["gists_url"],
        starredUrl: json["starred_url"],
        subscriptionsUrl: json["subscriptions_url"],
        organizationsUrl: json["organizations_url"],
        reposUrl: json["repos_url"],
        eventsUrl: json["events_url"],
        receivedEventsUrl: json["received_events_url"],
        type: typeValues.map[json["type"]] ?? Type.organization,
        siteAdmin: json["site_admin"],
    );

    Map<String, dynamic> toJson() => {
        "login": login,
        "id": id,
        "node_id": nodeId,
        "avatar_url": avatarUrl,
        "gravatar_id": gravatarId,
        "url": url,
        "html_url": htmlUrl,
        "followers_url": followersUrl,
        "following_url": followingUrl,
        "gists_url": gistsUrl,
        "starred_url": starredUrl,
        "subscriptions_url": subscriptionsUrl,
        "organizations_url": organizationsUrl,
        "repos_url": reposUrl,
        "events_url": eventsUrl,
        "received_events_url": receivedEventsUrl,
        "type": typeValues.reverse[type],
        "site_admin": siteAdmin,
    };
}

enum Type {
    // ORGANIZATION,
    // USER
    organization,
    user,
}

final typeValues = EnumValues({
    "Organization": Type.organization,
    "User": Type.user
});

enum Visibility {
    public
}

final visibilityValues = EnumValues({
    "public": Visibility.public
});

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
            reverseMap = map.map((k, v) => MapEntry(v, k));
            return reverseMap;
    }
}