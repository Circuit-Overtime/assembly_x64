# Contributing to MIPS Code Repository

🎉 Thank you for considering contributing to this repository! We welcome contributions to various MIPS topics as part of Hacktoberfest. Below are the guidelines to help you get started.

## How to Contribute

1. **Fork the repository**
   - Click the 'Fork' button at the top right of this page to fork the repository.

2. **Clone your fork**
   - Clone your fork locally:
     ```bash
     git clone https://github.com/Circuit-Overtime/assembly_x64.git
     cd assembly_x64
     ```

3. **Create a new branch**
   - Always create a new branch for your work:
     ```bash
     git checkout -b your-branch-name
     ```

4. **Make your changes**
   - Add your MIPS code for a specific topic under the relevant folder.
   - Ensure your code is well-documented with inline comments explaining its logic.
   - Add a new file for each topic in a consistent naming format:
     ```plaintext
     topic_name.asm
     ```
     For example:
     ```plaintext
     sorting_algorithm.asm
     ```

5. **Test your code**
   - Make sure to test your code using a MIPS simulator (such as [MARS](http://courses.missouristate.edu/kenvollmar/mars/) or [SPIM](https://spimsimulator.sourceforge.net/)) to ensure it's working correctly.

6. **Add your contribution to the README (Optional)**
   - If you want, you can also add a short description of your code to the main `README.md`.

7. **Commit your changes**
   - Commit your changes with a meaningful message:
     ```bash
     git add .
     git commit -m "Added MIPS code for topic_name"
     ```

8. **Push to your fork**
   - Push your changes to your forked repository:
     ```bash
     git push origin your-branch-name
     ```

9. **Create a Pull Request**
   - Open a Pull Request from your branch to the `main` branch of the original repository:
     - Go to the 'Pull Requests' tab on the original repository.
     - Click 'New Pull Request' and select your branch.
     - Provide a description of your changes.
   - Make sure to link your pull request to an existing issue if applicable, or create a new issue.

## Contribution Guidelines

- **Code Quality**: Ensure that your code follows clean and efficient programming practices.
- **Documentation**: Add comments in your code explaining the logic. You can also add details to the `README.md` for more complex topics.
- **Topics**: Only contribute MIPS code that fits the scope of the repository (e.g., algorithms, data structures, system calls).
- **Duplicate Contributions**: Before submitting, check if a similar solution already exists. If it does, consider improving it rather than submitting a duplicate.

## Hacktoberfest Participation

If you're contributing for Hacktoberfest, make sure:
- Your pull requests are substantial (not just fixing typos or simple formatting issues).
- They are labeled as `hacktoberfest-accepted` once reviewed.
- You follow the official [Hacktoberfest guidelines](https://hacktoberfest.com/participation/).

## Code of Conduct

Please note that this project adheres to the [Contributor Covenant Code of Conduct](./CODE_OF_CONDUCT.md). By participating, you are expected to uphold this code.

---

## Resources

- [MIPS Assembly Language Programming Guide](https://courses.missouristate.edu/KenVollmar/mars/help/MIPSHelp.html)
- [MARS MIPS Simulator](http://courses.missouristate.edu/KenVollmar/mars/)
- [SPIM MIPS Simulator](https://spimsimulator.sourceforge.net/)

---

Feel free to ask questions or seek guidance by opening an issue!
