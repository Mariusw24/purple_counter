module purple_counter::counter {

    use sui::clock::{Clock, timestamp_ms};
    use sui::event;

    // Error codes
    const E_NOT_OWNER: u64 = 1;

    // Counter object definition
    public struct Counter has key {
        id: UID,
        owner: address,
        value: u64,
        created_at: u64,
    }

    // Events
    public struct CounterCreatedEvent has copy, drop {
        owner: address,
        timestamp: u64,
    }

    public struct CounterIncrementedEvent has copy, drop {
        owner: address,
        new_value: u64,
    }

    // Create a new Counter owned by the sender
    public fun create_counter(clock: &Clock, ctx: &mut TxContext) {
        let owner = tx_context::sender(ctx);
        let counter = Counter {
            id: object::new(ctx),
            owner,
            value: 0,
            created_at: timestamp_ms(clock),
        };
        event::emit(CounterCreatedEvent { owner, timestamp: counter.created_at });
        transfer::transfer(counter, owner);
    }

    // Increment the counter by 1
    public fun increment(counter: &mut Counter, ctx: &mut TxContext) {
        let caller = tx_context::sender(ctx);

        // Verifying the owner, only the owner can increment it
        assert!(caller == counter.owner, E_NOT_OWNER);
        counter.value = counter.value + 1;
        event::emit(CounterIncrementedEvent { owner: caller, new_value: counter.value });
    }

    // Get the current value (read-only)
    public fun get_value(counter: &Counter): u64 {
        counter.value
    }
}