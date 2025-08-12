"""CLI Dev Toolbox - A Python CLI utility for developers.

This package provides command-line tools for JSON↔CSV conversion,
pretty JSON printing, and URL fetch timing.
"""

__version__ = "0.1.2"
__description__ = (
    "A Python CLI utility for developers - JSON↔CSV conversion, "
    "pretty JSON, and URL fetch timing."
)

from .toolbox import main

__all__ = ["main"]
