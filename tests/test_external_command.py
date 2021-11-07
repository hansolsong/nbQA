"""Tets running external command."""
import os
import shutil

import pytest

from nbqa.__main__ import main


@pytest.mark.skipif(
    shutil.which("true") is None, reason="command not found on platform"
)
def test_external_command() -> None:
    """Test local script is picked up."""
    cwd = os.getcwd()
    os.chdir(os.path.join("tests", "invalid_data"))
    try:
        main(["true", ".", "--nbqa-is-external"])
    finally:
        os.chdir(cwd)
