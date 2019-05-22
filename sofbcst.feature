@businesscriticalsystemtest
Feature: sofbcst

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

  @ORPHAN
  Scenario: move order state to sent for fulfillment
    Given an order is in the allocated state
    When Coworker fulfill the order
    Then Coworker change the order state to sent for fulfillment
    And an mail is generated for notify customer

  @ORPHAN
  Scenario: move order state to delivery planned
    Given an order is in the sent for fulfillment state
    When Coworker plans delivery for order
    Then Coworker change the order state to delivery planned

  @ORPHAN
  Scenario: move order state to released for picking
    Given an order is in the delivery planned state
    When Coworker release the delivery from warehouse
    Then Coworker change the order state to released for picking

  @ORPHAN
  Scenario: move order state to picked
    Given an order is in the released for picking state
    When Coworker pick the delivery from warehouse
    Then Coworker change the order state to picked

  @ORPHAN
  Scenario: move order state to ready for loading
    Given an order is in the picked state
    When Coworker packed the delivery with products
    Then Coworker change the order state to ready for loading

  @ORPHAN
  Scenario: move order state to loaded at central unit
    Given an order is in the ready for loading state
    When Load the shipment from warehouse
    Then Coworker change the order state to loaded at CU

  @ORPHAN
  Scenario: move order state to dispatched from central unit
    Given an order is in the loaded at central unit state
    When Dispatch the shipment to hub
    Then Coworker change the order state to dispatched
    And an mail is generated for dispatched

  @ORPHAN
  Scenario: move order state to received at hub
    Given an order is in the dispatched from central unit state
    When Order reaches to hub(lsc)
    Then Coworker change the order state to received at hub
    And an mail is generated for delivery notification

  @ORPHAN
  Scenario: move order state to loaded on truck
    Given an order is in the received at hub state
    When Coworker pick the order from hub(lsc)
    Then Coworker change the order state to loaded on truck

  @ORPHAN
  Scenario: move order state to delivered
    Given an order is in the loaded on delivery truck state
    When Customer received the product
    Then Coworker change the order state to delivery
    And an mail is generated for delivery confirmation
    And Coworker close the order
