//
//  PopularArticlesModelBase.swift
//  NYTimesMostPopularArticles
//
//  Created by Farhan Khan on 26/05/2021.
//

import Foundation
struct PopularArticlesModelBase : Codable {
	let status : String?
	let copyright : String?
	let num_results : Int?
    let results : [PopularArticles]?

	enum CodingKeys: String, CodingKey {

		case status = "status"
		case copyright = "copyright"
		case num_results = "num_results"
		case results = "results"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		status = try values.decodeIfPresent(String.self, forKey: .status)
		copyright = try values.decodeIfPresent(String.self, forKey: .copyright)
		num_results = try values.decodeIfPresent(Int.self, forKey: .num_results)
		results = try values.decodeIfPresent([PopularArticles].self, forKey: .results)
	}

}

struct PopularArticles : Codable {
    let uri : String?
    let url : String?
    let id : Int?
    let asset_id : Int?
    let source : String?
    let published_date : String?
    let updated : String?
    let section : String?
    let subsection : String?
    let nytdsection : String?
    let column : String?
    let byline : String?
    let type : String?
    let title : String?
    let abstract : String?
    let media : [Media]?
 

    enum CodingKeys: String, CodingKey {

        case uri = "uri"
        case url = "url"
        case id = "id"
        case asset_id = "asset_id"
        case source = "source"
        case published_date = "published_date"
        case updated = "updated"
        case section = "section"
        case subsection = "subsection"
        case nytdsection = "nytdsection"
        case column = "column"
        case byline = "byline"
        case type = "type"
        case title = "title"
        case abstract = "abstract"
        case media = "media"

    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        uri = try values.decodeIfPresent(String.self, forKey: .uri)
        url = try values.decodeIfPresent(String.self, forKey: .url)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        asset_id = try values.decodeIfPresent(Int.self, forKey: .asset_id)
        source = try values.decodeIfPresent(String.self, forKey: .source)
        published_date = try values.decodeIfPresent(String.self, forKey: .published_date)
        updated = try values.decodeIfPresent(String.self, forKey: .updated)
        section = try values.decodeIfPresent(String.self, forKey: .section)
        subsection = try values.decodeIfPresent(String.self, forKey: .subsection)
        nytdsection = try values.decodeIfPresent(String.self, forKey: .nytdsection)
        column = try values.decodeIfPresent(String.self, forKey: .column)
        byline = try values.decodeIfPresent(String.self, forKey: .byline)
        type = try values.decodeIfPresent(String.self, forKey: .type)
        title = try values.decodeIfPresent(String.self, forKey: .title)
        abstract = try values.decodeIfPresent(String.self, forKey: .abstract)
        media = try values.decodeIfPresent([Media].self, forKey: .media)
        
    }

}


struct MediaMetadata : Codable {
    let url : String?
    let format : String?
    let height : Int?
    let width : Int?

    enum CodingKeys: String, CodingKey {

        case url = "url"
        case format = "format"
        case height = "height"
        case width = "width"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        url = try values.decodeIfPresent(String.self, forKey: .url)
        format = try values.decodeIfPresent(String.self, forKey: .format)
        height = try values.decodeIfPresent(Int.self, forKey: .height)
        width = try values.decodeIfPresent(Int.self, forKey: .width)
    }

}


struct Media : Codable {
    let type : String?
    let subtype : String?
    let caption : String?
    let copyright : String?
    let approved_for_syndication : Int?
    let mediaMetaData : [MediaMetadata]?

    enum CodingKeys: String, CodingKey {

        case type = "type"
        case subtype = "subtype"
        case caption = "caption"
        case copyright = "copyright"
        case approved_for_syndication = "approved_for_syndication"
        case mediaMetaData = "media-metadata"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        type = try values.decodeIfPresent(String.self, forKey: .type)
        subtype = try values.decodeIfPresent(String.self, forKey: .subtype)
        caption = try values.decodeIfPresent(String.self, forKey: .caption)
        copyright = try values.decodeIfPresent(String.self, forKey: .copyright)
        approved_for_syndication = try values.decodeIfPresent(Int.self, forKey: .approved_for_syndication)
        mediaMetaData = try values.decodeIfPresent([MediaMetadata].self, forKey: .mediaMetaData)
    }

}


