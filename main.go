package main

import (
	"bytes"
	"errors"
	"net/http"
	"os/exec"

	"github.com/labstack/echo/v4"
	"github.com/labstack/echo/v4/middleware"
)

func main() {
	e := echo.New()

	e.Use(middleware.Logger())
	e.Use(middleware.Recover())

	e.POST("/test", func(c echo.Context) error {
		text := c.FormValue("text")

		if text == "" {
			return errors.New("missing `text` form value")
		}

		awkScript := c.FormValue("awkScript")

		if awkScript == "" {
			return errors.New("missing `awkScript` form value")
		}

		result, err := awk(awkScript, text)

		if err != nil {
			return err
		}

		return c.String(http.StatusOK, result)
	})

	e.Logger.Fatal(e.Start(":8080"))
}

func awk(script string, text string) (string, error) {
	cmd := exec.Command("awk", script)

	buffer := bytes.NewBufferString(text)

	cmd.Stdin = buffer

	data, err := cmd.Output()

	if err != nil {
		return "", err
	}

	return string(data), nil
}
