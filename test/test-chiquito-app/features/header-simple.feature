@happypath
Feature: Chiquito header should be returned for all requests

  Scenario: Expected requests return expected header
	When I request 200
	Then I get the X-Chiquito header containing 200

  Scenario: Expected requests return expected header
        When I request 300
        Then I get the X-Chiquito header containing 300

  Scenario: Expected requests return expected header
        When I request 400
        Then I get the X-Chiquito header containing 400

  Scenario: Expected requests return expected header
        When I request 500
        Then I get the X-Chiquito header containing 500
