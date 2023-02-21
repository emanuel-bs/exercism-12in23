def response(hey_bob):
    bob_response = "Whatever."
    if (not hey_bob or hey_bob.strip() == "" or len(hey_bob) == 0):
        bob_response = "Fine. Be that way!"
    elif (hey_bob.endswith("?") and hey_bob.isupper()):
        bob_response = "Calm down, I know what I'm doing!"
    elif hey_bob.strip().endswith("?"):
        bob_response = "Sure."
    elif hey_bob.isupper() :
        bob_response = "Whoa, chill out!"
    return bob_response
