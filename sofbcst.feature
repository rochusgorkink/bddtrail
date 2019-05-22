Feature: sofbcst

  business systems critical sytem test for sof

  @ORPHAN
  Scenario: create order
    Given Buyable article with quantity
    When an order is created
    Then Customer receives the order number
    And an mail is generated for confirmation
    

  @ORPHAN
  Scenario: move order state to allocated
    Given Customer receives the order number
    When Coworker allocate the article for order
    Then Coworker change the order state to allocated
