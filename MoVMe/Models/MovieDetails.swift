//
//  Movie.swift
//  MoVMe
//
//  Created by Panca Setiawan on 20/03/22.
//

import Foundation

struct MoviesDetailsResponse: Codable {
    let results: [MovieDetails]
}

struct MovieDetails: Codable {
    let id: Int
    let original_title: String?
    let original_name: String?
    let overview: String?
    let poster_path: String?
    let vote_count: Int
    let vote_average: Double
    let release_date: String?
}




/*
 let id: Int
 let media_type: String?
 let original_name: String?
 let original_title: String?
 let poster_path: String?
 let overview: String?
 let vote_count: Int
 let release_date: String?
 let vote_average: Double // NOT A STRING
 */



/*
 {
adult = 0;
"backdrop_path" = "/wPU78OPN4BYEgWYdXyg0phMee64.jpg";
"genre_ids" =             (
 18,
 80
);
id = 278;
"original_language" = en;
"original_title" = "The Shawshank Redemption";
overview = "Framed in the 1940s for the double murder of his wife and her lover, upstanding banker Andy Dufresne begins a new life at the Shawshank prison, where he puts his accounting skills to work for an amoral warden. During his long stretch in prison, Dufresne comes to be admired by the other inmates -- including an older prisoner named Red -- for his integrity and unquenchable sense of hope.";
popularity = "80.956";
"poster_path" = "/q6y0Go1tsGEsmtFryDOJo3dEmqu.jpg";
"release_date" = "1994-09-23";
title = "The Shawshank Redemption";
video = 0;
"vote_average" = "8.699999999999999";
"vote_count" = 20976;
 */
