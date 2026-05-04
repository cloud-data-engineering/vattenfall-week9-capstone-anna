"""Placeholder tests for configuration file presence."""

from pathlib import Path


def test_required_config_files_exist():
    required_files = [
        "config/project_config.yml",
        "config/paths_config.yml",
        "config/tables_config.yml",
    ]

    for file_path in required_files:
        assert Path(file_path).is_file(), f"Missing required config file: {file_path}"