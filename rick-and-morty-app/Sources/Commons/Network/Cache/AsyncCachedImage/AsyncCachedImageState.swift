//
//  AsyncCachedImageState.swift
//  rick-and-morty-app
//
//  Created by sw on 10/11/23.
//

import Foundation

enum AsyncCachedImageState {
	case idle,
			 fetching,
			 success(_ image: Data),
			 failure(_ error: ApiError)
}

