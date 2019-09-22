# EFI for Lenovo E480/20KN/8550U

This is my ongoing EFI folder. If I find a certain version stable enough, I will mark the version accordingly with a GitHub tag.

## Disclaimer

I am not liable for any damage to your hardware by using this folder. In many cases, you should not use this folder verbatim; for example, if you have made any changes to your BIOS that differ from mine, or we are running different version BIOS, there's no guarentee this will work. Also, for example, if I have used a DSDT.aml file, it will almost certainly cause issues. This is not an exhaustive list of reasons this won't work, either.

If you don't understand this disclaimer in its entirety, you should probably start with a guide. That's not what this repository is. As _nguyenmac_ once said on a relavant forum:

> HACKINTOSH IS NOT FOR LAZY PEOPLE.

## Relevant Specifications

- Lenovo E480 
- i7-8550U
- RX550 (disabled via SSDT-DDGPU)

## License

DSDT and SSDT files in the origin folder, parts of the DSDT.{aml,dsl}, and any SSDT files _that have a matching file in origin_ are unlicensable, and the LICENSE in this repository does not apply to these files. To the best of my knowledge, they cannot be used for any reason unless you own the relevant hardware which comes with the same binaries. The changes made to the files in subsequent commits are licensed in accordance to the rest of this repository.

If these files need to be removed, or licensing/sub-licensing can occur in a more clean manner, please contact me. Through hotpatching and other techniques, the ultimate goal is to remove these files while maintaining the changes necessary.

For all other files, see `LICENSE.md`.

### Rationale

**Disclaimer**: I am not a lawyer. This is not legal advice.

Since I will likely pull code in from RehabMan's repositories in a few instances, I have chosen GPLv2 for this repository. Any code licensed under something more permissive that I end up incorporating here should be compatible to the best of my knowledge.

Many files come from places with a more permissive license, and I may not have made any modifications to the work. In such cases, you can use the work in the original license. For example, to the best of my knowledge, Clover is licensed under a BSD license.

If I have made a mistake, either accidentally purposefully, by relicensing into GPLv2 in an incompatible manner, please open an issue or contact me. I am not a license wizard.

