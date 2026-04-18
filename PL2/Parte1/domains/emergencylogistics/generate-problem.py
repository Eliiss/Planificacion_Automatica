#!/usr/bin/env python3

"""
Problem generator for the PL2/Parte1 JSHOP2 emergencylogistics domain.

It follows the spirit of the PL1 generators, but it writes a JSHOP2
`defproblem` file instead of a PDDL problem.
"""

from optparse import OptionParser
import random
import sys


CONTENT_TYPES = ["food", "medicine"]


def setup_content_types(num_crates, num_goals):
    """Assign each crate a content type, ensuring every type has at least one crate."""
    while True:
        num_crates_with_contents = []
        crates_left = num_crates

        for index in range(len(CONTENT_TYPES) - 1):
            types_after_this = len(CONTENT_TYPES) - index - 1
            max_now = crates_left - types_after_this
            amount = random.randint(1, max_now)
            num_crates_with_contents.append(amount)
            crates_left -= amount

        num_crates_with_contents.append(crates_left)

        max_supported_goals = sum(num_crates_with_contents)
        if num_goals <= max_supported_goals:
            break

    crates_with_contents = []
    counter = 1
    for amount in num_crates_with_contents:
        crates = []
        for _ in range(amount):
            crates.append(f"box{counter}")
            counter += 1
        crates_with_contents.append(crates)

    return crates_with_contents


def setup_person_needs(num_persons, num_goals, crates_with_contents):
    """
    Generate a set of needs.

    Each person can need at most one box per content type, exactly like the PL1
    generator logic.
    """
    need = [[False for _ in range(len(CONTENT_TYPES))] for _ in range(num_persons)]
    goals_per_content = [0 for _ in range(len(CONTENT_TYPES))]

    for _ in range(num_goals):
        generated = False
        while not generated:
            rand_person = random.randint(0, num_persons - 1)
            rand_content = random.randint(0, len(CONTENT_TYPES) - 1)
            if (
                goals_per_content[rand_content] < len(crates_with_contents[rand_content])
                and not need[rand_person][rand_content]
            ):
                need[rand_person][rand_content] = True
                goals_per_content[rand_content] += 1
                generated = True

    return need


def build_problem_text(locations, persons, crates_with_contents, needs):
    location_names = [f"loc{i}" for i in range(1, locations + 1)]
    person_names = [f"person{i}" for i in range(1, persons + 1)]

    lines = []
    lines.append("(defproblem problem emergencylogistics")
    lines.append("  (")
    lines.append("   ; Dron en el deposito")
    lines.append("   (at-drone d1 depot)")
    lines.append("")
    lines.append("   ; Brazos del dron")
    lines.append("   (arm-of a1 d1)")
    lines.append("   (arm-of a2 d1)")
    lines.append("   (arm-free a1)")
    lines.append("   (arm-free a2)")
    lines.append("")
    lines.append("   ; Personas en localizaciones")

    for index, person_name in enumerate(person_names):
        person_location = location_names[index % len(location_names)]
        lines.append(f"   (at-person {person_name} {person_location})")

    lines.append("")
    lines.append("   ; Cajas en el deposito")
    for boxes in crates_with_contents:
        for box_name in boxes:
            lines.append(f"   (at-box {box_name} depot)")

    lines.append("")
    lines.append("   ; Contenido de las cajas")
    for content_index, boxes in enumerate(crates_with_contents):
        content_name = CONTENT_TYPES[content_index]
        for box_name in boxes:
            lines.append(f"   (box-has {box_name} {content_name})")

    lines.append("")
    lines.append("   ; Las cajas estan llenas")
    for boxes in crates_with_contents:
        for box_name in boxes:
            lines.append(f"   (full-box {box_name})")

    lines.append("")
    lines.append("   ; Personas necesitan")
    for person_index, person_name in enumerate(person_names):
        for content_index, content_name in enumerate(CONTENT_TYPES):
            if needs[person_index][content_index]:
                lines.append(f"   (needs {person_name} {content_name})")

    lines.append("  )")
    lines.append("")
    lines.append("  ; Tarea principal: enviar todas las cajas necesarias")
    lines.append("  ((enviar-todo))")
    lines.append(")")

    return "\n".join(lines) + "\n"


def main():
    parser = OptionParser(usage="python generate-problem.py [-help] options...")
    parser.add_option(
        "-l",
        "--locations",
        metavar="NUM",
        dest="locations",
        action="store",
        type=int,
        help="number of locations apart from the depot",
    )
    parser.add_option(
        "-p",
        "--persons",
        metavar="NUM",
        dest="persons",
        action="store",
        type=int,
        help="number of persons",
    )
    parser.add_option(
        "-c",
        "--crates",
        metavar="NUM",
        dest="crates",
        action="store",
        type=int,
        help="number of boxes available",
    )
    parser.add_option(
        "-g",
        "--goals",
        metavar="NUM",
        dest="goals",
        action="store",
        type=int,
        help="number of needs to generate",
    )
    parser.add_option(
        "-o",
        "--output",
        metavar="FILE",
        dest="output",
        action="store",
        default="problem",
        help="output file path (default: problem)",
    )
    parser.add_option(
        "-s",
        "--seed",
        metavar="NUM",
        dest="seed",
        action="store",
        type=int,
        help="random seed for reproducible generation",
    )

    (options, _) = parser.parse_args()

    if options.locations is None:
        print("You must specify --locations (use --help for help)")
        sys.exit(1)
    if options.persons is None:
        print("You must specify --persons (use --help for help)")
        sys.exit(1)
    if options.crates is None:
        print("You must specify --crates (use --help for help)")
        sys.exit(1)
    if options.goals is None:
        print("You must specify --goals (use --help for help)")
        sys.exit(1)

    if options.locations < 1:
        print("There must be at least 1 location")
        sys.exit(1)
    if options.persons < 1:
        print("There must be at least 1 person")
        sys.exit(1)
    if options.crates < len(CONTENT_TYPES):
        print("There must be at least", len(CONTENT_TYPES), "boxes to cover all content types")
        sys.exit(1)
    if options.goals < 1:
        print("There must be at least 1 need")
        sys.exit(1)
    if options.goals > options.crates:
        print("Cannot have more needs than boxes")
        sys.exit(1)
    if options.goals > len(CONTENT_TYPES) * options.persons:
        print(
            "For",
            options.persons,
            "persons, you can have at most",
            len(CONTENT_TYPES) * options.persons,
            "needs",
        )
        sys.exit(1)

    if options.seed is not None:
        random.seed(options.seed)

    crates_with_contents = setup_content_types(options.crates, options.goals)
    needs = setup_person_needs(options.persons, options.goals, crates_with_contents)
    problem_text = build_problem_text(
        options.locations,
        options.persons,
        crates_with_contents,
        needs,
    )

    with open(options.output, "w", encoding="utf-8") as handler:
        handler.write(problem_text)

    print(f"Generated {options.output}")


if __name__ == "__main__":
    main()
