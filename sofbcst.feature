Feature: sofbcst

  business systems critical sytem test for sof

  @ORPHAN
  Scenario: create order
    Given Buyable article with quantity
    When an order is created
    Then Customer receives the order number
    And an mail is generated for confirmation
    
