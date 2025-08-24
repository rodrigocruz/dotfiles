#!/usr/bin/env python3

def main(args):
    print("Test kitten main() called!")
    return "test result"

def handle_result(args, result, target_window_id, boss):
    print(f"Test kitten handle_result called with: {result}")

if __name__ == "__main__":
    print("Test kitten run directly")