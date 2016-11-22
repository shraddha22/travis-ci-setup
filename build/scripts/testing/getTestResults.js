
					lo.forEach(row.Coverage.uncoveredLines, function (line_number) {
						if (id_to_class_map[class_id].coverage[line_number - 1] === null) {
							id_to_class_map[class_id].coverage[line_number - 1] = 0;
						}
					});
				}
			});

			deferred.resolve();
		}
	});

	return deferred.promise;
};

/**
* Posts the data to coveralls
*/
var postToCoveralls = function () {
	'use strict';

	var fs_stats, post_options,
		deferred = Q.defer(),
		coveralls_data = {
			repo_token: process.env.COVERALLS_REPO_TOKEN,
			service_name: 'travis-ci',
			service_job_id: process.env.TRAVIS_JOB_ID,
			source_files: lo.values(id_to_class_map)
		};

	console.log('Posting data to coveralls');

	fs.writeFile('/tmp/coveralls_data.json', JSON.stringify(coveralls_data), function (fs_error) {
		if (fs_error) {
			deferred.reject(new Error(fs_error));
		} else {
			fs_stats = fs.statSync('/tmp/coveralls_data.json');

			post_options = {
				multipart: true,
				data: {
					json_file: restler.file('/tmp/coveralls_data.json', null, fs_stats.size, null, 'application/json')
				}
			};

			restler.post('https://coveralls.io/api/v1/jobs', post_options).on("complete", function (data) {
				deferred.resolve();
			});
		}
	});

	return deferred.promise;
};

Q.fcall(sfdcLogin)
	.then(buildClassIdToClassDataMap)
	.then(runAllTests)
	.then(waitUntilTestsComplete)
	.then(buildCoverallsCoverage)
	.then(postToCoveralls)
	.catch(function (error) {
		'use strict';
		console.log(error);
	})
	.done(function () {
		'use strict';
	});
Contact GitHub API Training Shop Blog About
© 2016 GitHub, Inc. Term