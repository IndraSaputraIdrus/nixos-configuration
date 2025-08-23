{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    postgresql_16
  ];

  programs.bash.shellAliases = {
    pg-start = ''
      DATA_DIR="$HOME/.local/share/postgres"
      PG_BIN="${pkgs.postgresql_16}/bin"
      SHARE_DIR="${pkgs.postgresql_16}/share/postgresql"
      SOCK_DIR="$DATA_DIR/run"

      mkdir -p "$DATA_DIR"
      mkdir -p "$SOCK_DIR"

      if [ ! -f "$DATA_DIR/PG_VERSION" ]; then
        echo "Initializing PostgreSQL database in $DATA_DIR..."
        "$PG_BIN/initdb" -D "$DATA_DIR" -L "$SHARE_DIR"
      fi

      "$PG_BIN/pg_ctl" -D "$DATA_DIR" \
        -l "$DATA_DIR/server.log" \
        -o "-k $SOCK_DIR" \
        start
    '';

    pg-stop = ''
      PG_BIN="${pkgs.postgresql_16}/bin"
      "$PG_BIN/pg_ctl" -D "$HOME/.local/share/postgres" stop
    '';

    pg-status = ''
      PG_BIN="${pkgs.postgresql_16}/bin"
      "$PG_BIN/pg_ctl" -D "$HOME/.local/share/postgres" status
    '';

    pg-uri = ''
      echo "postgresql:///$USER?host=$HOME/.local/share/postgres/run"
    '';

    pg-connect = ''
      PG_BIN="${pkgs.postgresql_16}/bin"
      "$PG_BIN/psql" -h "$HOME/.local/share/postgres/run" -d "$USER"
    '';
  };
}
